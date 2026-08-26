"use client";

import * as React from "react";
import { usePathname } from "next/navigation";

import { SidebarProvider, SidebarInset } from "@/components/ui/sidebar";
import { AppSidebar } from "@/components/layout/AppSidebar";
import { AppTopbar } from "@/components/layout/AppTopbar";
import { Toaster } from "@/components/ui/sonner";

import { useAuth } from "@/app/inventario/hooks/use-auth";
import { Loader2 } from "lucide-react";

export function AppShell({ children }: { children: React.ReactNode }) {
  const pathname = usePathname();
  const { isLoading: authLoading } = useAuth();

  const isPublicPage =
    pathname.startsWith("/auth") ||
    pathname.startsWith("/error") ||
    pathname === "/"; // RootPage also does redirects

  if (authLoading && !isPublicPage) {
    return (
      <div className="fixed inset-0 z-[9999] flex flex-col items-center justify-center bg-background gap-4">
        <Loader2 className="animate-spin text-primary" size={48} />
        <span className="text-muted-foreground font-medium animate-pulse">Autenticando...</span>
      </div>
    );
  }

  return (
    <>
      {isPublicPage ? (
        <main className="min-h-screen w-full flex items-center justify-center bg-muted/30">
          {children}
        </main>
      ) : (
        <SidebarProvider>
          <div className="flex h-[100dvh] w-full overflow-hidden">
            <AppSidebar />
            <SidebarInset className="flex flex-col bg-secondary/10 dark:bg-secondary/5 h-[100dvh] w-full overflow-hidden">
              <AppTopbar />
              <div className="flex-1 flex flex-col w-full overflow-y-auto">
                <main className="flex-1 p-3 sm:p-5 lg:p-6 w-full min-w-0 max-w-full">
                  {children}
                </main>
                <footer className="h-12 border-t border-border/40 flex items-center justify-center text-[10px] text-muted-foreground uppercase tracking-widest px-4 text-center shrink-0">
                  © 2026 MRO Inventario — ALM MRO CHILCA
                </footer>
              </div>
            </SidebarInset>
          </div>
        </SidebarProvider>
      )}
      <Toaster position="top-right" richColors closeButton />
    </>
  );
}
