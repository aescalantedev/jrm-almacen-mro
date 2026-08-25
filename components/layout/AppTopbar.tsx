"use client";

import { Search, Bell, Sun, Moon } from "lucide-react";
import { useTheme } from "@teispace/next-themes";
import { SidebarTrigger } from "@/components/ui/sidebar";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import { ThemeColorToggle } from "@/components/theme-color-toggle";

function getUserFromStorage() {
  if (typeof window === 'undefined') return null;
  try {
    const raw = localStorage.getItem('mro_auth');
    if (!raw) return null;
    return JSON.parse(raw).user;
  } catch {
    return null;
  }
}

export function AppTopbar() {
  const { setTheme, theme } = useTheme();
  const user = getUserFromStorage();

  const handleLogout = () => {
    localStorage.removeItem('mro_auth');
    window.location.href = '/auth/login';
  };

  return (
    <header className="sticky top-0 z-40 w-full border-b border-border/40 bg-background/80 backdrop-blur-xl supports-[backdrop-filter]:bg-background/60">
      <div className="flex h-16 items-center gap-4 px-6 lg:px-10">
        <SidebarTrigger className="hover:bg-secondary/80 rounded-lg" />
        <div className="h-6 w-[1px] bg-border/50 hidden md:block" />

        <div className="flex-1 max-w-md relative group hidden sm:block">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground group-focus-within:text-primary transition-colors" />
          <Input
            placeholder="Buscar producto..."
            className="pl-10 h-9 bg-secondary/30 border-none rounded-xl focus-visible:ring-1 focus-visible:ring-primary/30 transition-all"
          />
        </div>

        <div className="ml-auto flex items-center gap-2">
          <ThemeColorToggle />
          <Button
            variant="ghost"
            size="icon"
            className="rounded-full"
            onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
          >
            <Sun className="h-5 w-5 text-muted-foreground rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
            <Moon className="absolute h-5 w-5 text-muted-foreground rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
            <span className="sr-only">Toggle theme</span>
          </Button>

          <Button variant="ghost" size="icon" className="rounded-full relative">
             <Bell className="h-5 w-5 text-muted-foreground" />
             <span className="absolute top-2 right-2 h-2 w-2 bg-red-500 rounded-full border-2 border-background" />
          </Button>

          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button variant="ghost" className="relative h-9 w-9 rounded-full p-0 overflow-hidden ring-offset-background transition-all hover:ring-2 hover:ring-primary/20">
                <Avatar className="h-9 w-9 border border-border/50">
                  <AvatarFallback className="bg-primary/10 text-primary text-xs font-bold" suppressHydrationWarning>
                    {user?.nombre?.split(' ').map((n: string) => n[0]).join('').slice(0, 2).toUpperCase() || 'U'}
                  </AvatarFallback>
                </Avatar>
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent className="w-56 mt-2 rounded-xl" align="end" forceMount>
              <DropdownMenuLabel className="font-normal">
                <div className="flex flex-col space-y-1">
                  <p className="text-sm font-semibold leading-none text-foreground" suppressHydrationWarning>{user?.nombre || 'Usuario'}</p>
                  <p className="text-xs leading-none text-muted-foreground capitalize" suppressHydrationWarning>{user?.rol || 'contador'} - ALM MRO CHILCA</p>
                </div>
              </DropdownMenuLabel>
              <DropdownMenuSeparator />
              <DropdownMenuItem className="cursor-pointer rounded-lg">Mi Perfil</DropdownMenuItem>
              <DropdownMenuItem className="cursor-pointer rounded-lg">Configuracion</DropdownMenuItem>
              <DropdownMenuSeparator />
              <DropdownMenuItem onClick={handleLogout} className="cursor-pointer rounded-lg text-red-500 focus:text-red-500 focus:bg-red-50/10">
                Cerrar Sesion
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      </div>
    </header>
  );
}
