"use client";

import { useState, useEffect, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import {
  Barcode,
  ClipboardList,
  Package,
} from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { useAuth } from "./hooks/use-auth";
import { useIsAndroid } from "./hooks/use-is-android";
import { useConteoForm } from "./hooks/use-conteo-form";
import { useRegistros } from "./hooks/use-registros";
import { useCatalogo } from "./hooks/use-catalogo";
import { ConteoTab } from "./components/conteo-tab";
import { RegistrosTab } from "./components/registros-tab";
import { CatalogoTab } from "./components/catalogo-tab";
import { BottomNav } from "./components/bottom-nav";

function InventarioContent() {
  const { user, token } = useAuth();
  const isAndroid = useIsAndroid();
  const [activeTab, setActiveTab] = useState("conteo");
  const searchParams = useSearchParams();
  const skuParam = searchParams.get("sku");

  const {
    registros,
    loadingRegistros,
    loadingMore: loadingMoreRegistros,
    hasMore: hasMoreRegistros,
    total: totalRegistros,
    recordFilterStatus,
    setRecordFilterStatus,
    recordSearchQuery,
    setRecordSearchQuery,
    loadRegistros,
    loadMore: loadMoreRegistros,
    deleteRecord,
  } = useRegistros(token);

  const {
    form,
    setForm,
    isEditing,
    saving,
    showAdvanced,
    setShowAdvanced,
    searchQuery,
    setSearchQuery,
    stockResults,
    setStockResults,
    searching,
    dif,
    pesoTotal,
    updateQuantity,
    clearForm,
    searchStock,
    selectStock,
    handleSave,
    editRecord,
  } = useConteoForm(token, user, loadRegistros, setActiveTab);

  const {
    catalogItems,
    loadingCatalog,
    loadingMore: loadingMoreCatalog,
    hasMore: hasMoreCatalog,
    total: totalCatalog,
    catalogSearch,
    setCatalogSearch,
    loadCatalog,
    loadMore: loadMoreCatalog,
    pendingFilter,
    setPendingFilter,
  } = useCatalogo(token);

  useEffect(() => {
    if (token) {
      loadRegistros();
    }
  }, [token, loadRegistros]);

  useEffect(() => {
    if (activeTab === "catalogo" && token && catalogItems.length === 0) {
      loadCatalog();
    }
  }, [activeTab, token, catalogItems.length, loadCatalog]);

  // Si vino con ?sku=XYZ, selecciona el producto y limpia inmediatamente la URL
  useEffect(() => {
    if (skuParam && token) {
      setActiveTab("conteo");
      searchStock(skuParam.trim().toUpperCase(), true);
      if (typeof window !== "undefined") {
        window.history.replaceState({}, "", "/inventario");
      }
    }
  }, [skuParam, token, searchStock]);

  const handleClearWithUrlReset = () => {
    clearForm();
    if (typeof window !== "undefined") {
      window.history.replaceState({}, "", "/inventario");
    }
  };

  if (!user) return null;

  const tabContent = (
    <>
      <TabsContent value="conteo" className="mt-4 focus-visible:outline-none">
        <ConteoTab
          form={form}
          setForm={setForm}
          isEditing={isEditing}
          saving={saving}
          showAdvanced={showAdvanced}
          setShowAdvanced={setShowAdvanced}
          searchQuery={searchQuery}
          setSearchQuery={setSearchQuery}
          stockResults={stockResults}
          setStockResults={setStockResults}
          searching={searching}
          dif={dif}
          pesoTotal={pesoTotal}
          updateQuantity={updateQuantity}
          clearForm={handleClearWithUrlReset}
          searchStock={searchStock}
          selectStock={selectStock}
          handleSave={handleSave}
          catalogCount={catalogItems.length}
          onGoToCatalogo={() => setActiveTab("catalogo")}
        />
      </TabsContent>

      <TabsContent value="registros" className="mt-4 focus-visible:outline-none">
        <RegistrosTab
          registros={registros}
          loadingRegistros={loadingRegistros}
          loadingMore={loadingMoreRegistros}
          hasMore={hasMoreRegistros}
          total={totalRegistros}
          recordFilterStatus={recordFilterStatus}
          setRecordFilterStatus={setRecordFilterStatus}
          recordSearchQuery={recordSearchQuery}
          setRecordSearchQuery={setRecordSearchQuery}
          loadRegistros={loadRegistros}
          loadMore={loadMoreRegistros}
          editRecord={editRecord}
          deleteRecord={deleteRecord}
          onGoToConteo={() => setActiveTab("conteo")}
        />
      </TabsContent>

      <TabsContent value="catalogo" className="mt-4 focus-visible:outline-none">
        <CatalogoTab
          catalogItems={catalogItems}
          loadingCatalog={loadingCatalog}
          loadingMore={loadingMoreCatalog}
          hasMore={hasMoreCatalog}
          total={totalCatalog}
          catalogSearch={catalogSearch}
          setCatalogSearch={setCatalogSearch}
          loadCatalog={loadCatalog}
          loadMore={loadMoreCatalog}
          onSelectStock={selectStock}
          pendingFilter={pendingFilter}
          setPendingFilter={setPendingFilter}
        />
      </TabsContent>
    </>
  );

  return (
    <div className="w-full space-y-4">
      {/* Vista Desktop / Tablet (> md) o no Android */}
      <div className={isAndroid ? "hidden md:block" : "block"}>
        <Tabs value={activeTab} onValueChange={setActiveTab} className="w-full">
          <TabsList className="grid grid-cols-3 w-full h-12 p-1 bg-secondary/40 rounded-xl">
            <TabsTrigger
              value="conteo"
              className="flex items-center justify-center gap-1.5 sm:gap-2 text-xs sm:text-sm font-bold rounded-lg data-[state=active]:bg-background data-[state=active]:text-primary data-[state=active]:shadow-sm transition-all"
            >
              <Barcode className="h-4 w-4" />
              <span>Registrar Conteo</span>
              {isEditing && <span className="h-2 w-2 rounded-full bg-amber-500 animate-pulse" />}
            </TabsTrigger>

            <TabsTrigger
              value="registros"
              className="flex items-center justify-center gap-1.5 sm:gap-2 text-xs sm:text-sm font-bold rounded-lg data-[state=active]:bg-background data-[state=active]:text-primary data-[state=active]:shadow-sm transition-all"
            >
              <ClipboardList className="h-4 w-4" />
              <span>Mis Registros</span>
              <Badge variant="secondary" className="ml-1 px-1.5 py-0 text-[10px] font-mono">
                {totalRegistros}
              </Badge>
            </TabsTrigger>

            <TabsTrigger
              value="catalogo"
              className="flex items-center justify-center gap-1.5 sm:gap-2 text-xs sm:text-sm font-bold rounded-lg data-[state=active]:bg-background data-[state=active]:text-primary data-[state=active]:shadow-sm transition-all"
            >
              <Package className="h-4 w-4" />
              <span className="hidden sm:inline">Explorar Stock</span>
              <span className="sm:hidden">Catálogo</span>
            </TabsTrigger>
          </TabsList>

          {tabContent}
        </Tabs>
      </div>

      {/* Vista Mobile Android (< md) */}
      {isAndroid && (
        <div className="block md:hidden pb-20">
          <Tabs value={activeTab} className="w-full">
            {tabContent}
          </Tabs>
          <BottomNav
            activeTab={activeTab}
            onTabChange={setActiveTab}
            registrosCount={totalRegistros}
            isEditing={!!isEditing}
          />
        </div>
      )}
    </div>
  );
}

export default function InventarioPage() {
  return (
    <Suspense fallback={<div className="p-8 text-center text-xs text-muted-foreground">Cargando inventario...</div>}>
      <InventarioContent />
    </Suspense>
  );
}
