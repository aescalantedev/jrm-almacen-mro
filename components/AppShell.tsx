"use client";

import * as React from "react";
import { usePathname } from "next/navigation";

import { SidebarProvider, SidebarInset } from "@/components/ui/sidebar";
import { AppSidebar } from "@/components/layout/AppSidebar";
import { AppTopbar } from "@/components/layout/AppTopbar";
import { Toaster } from "@/components/ui/sonner";

export function AppShell({ children }: { children: React.ReactNode }) {
  const pathname = usePathname();

  const isPublicPage =
    pathname.startsWith("/auth") ||
    pathname.startsWith("/error");

  return (
    <>
      {isPublicPage ? (
        <main className="min-h-screen w-full flex items-center justify-center bg-muted/30">
          {children}
        </main>
      ) : (
        <SidebarProvider>
          <div className="flex min-h-screen w-full">
            <AppSidebar />
            <SidebarInset className="flex flex-col bg-secondary/10 dark:bg-secondary/5">
              <AppTopbar />
              <main className="flex-1 overflow-y-auto p-3 sm:p-5 lg:p-6 w-full min-w-0 max-w-full">
                {children}
              </main>
              <footer className="h-12 border-t border-border/40 flex items-center justify-center text-[10px] text-muted-foreground uppercase tracking-widest px-4 text-center">
                © 2026 MRO Inventario — ALM MRO CHILCA
              </footer>
            </SidebarInset>
          </div>
        </SidebarProvider>
      )}
      <Toaster position="top-right" richColors closeButton />
    </>
  );
}
