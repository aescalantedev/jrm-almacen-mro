"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { Warehouse, Eye, EyeOff, Loader2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { toast } from "sonner";

export default function LoginPage() {
  const router = useRouter();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPass, setShowPass] = useState(false);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    try {
      const raw = localStorage.getItem("mro_auth");
      if (raw) {
        const d = JSON.parse(raw);
        if (d?.token && d?.user) {
          router.replace("/inventario");
        }
      }
    } catch {
      // ignore
    }
  }, [router]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    try {
      const res = await fetch("/api/auth/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });
      const data = await res.json();
      if (!res.ok) {
        toast.error(data.error || "Error al iniciar sesión");
        setLoading(false);
        return;
      }
      localStorage.setItem("mro_auth", JSON.stringify(data));
      toast.success(`Bienvenido ${data.user.nombre}`);
      if (data.user.rol === "admin" || data.user.rol === "auditor") {
        router.replace("/dashboard");
      } else {
        router.replace("/inventario");
      }
    } catch {
      toast.error("Error de conexión");
      setLoading(false);
    }
  };

  return (
    <div className="w-full max-w-sm mx-auto px-4">
      <div className="flex flex-col items-center mb-8">
        <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-primary shadow-lg shadow-primary/20 mb-4">
          <Warehouse className="h-7 w-7 text-primary-foreground" />
        </div>
        <h1 className="text-2xl font-bold tracking-tight">MRO Inventario</h1>
        <p className="text-sm text-muted-foreground mt-1">ALM MRO CHILCA</p>
      </div>

      <Card className="shadow-xl border-border/50">
        <CardHeader className="space-y-1 pb-4">
          <CardTitle className="text-xl font-bold">Iniciar Sesion</CardTitle>
          <CardDescription>Ingrese sus credenciales para acceder</CardDescription>
        </CardHeader>
        <form onSubmit={handleSubmit}>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="email" className="text-xs font-semibold">Correo Electrónico</Label>
              <Input
                id="email"
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="Ingrese su correo electrónico"
                required
                className="h-11"
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="password" className="text-xs font-semibold">Contrasena</Label>
              <div className="relative">
                <Input
                  id="password"
                  type={showPass ? "text" : "password"}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="Ingrese su contrasena"
                  required
                  className="h-11 pr-10"
                />
                <button
                  type="button"
                  onClick={() => setShowPass(!showPass)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                >
                  {showPass ? <EyeOff size={16} /> : <Eye size={16} />}
                </button>
              </div>
            </div>
          </CardContent>
          <CardFooter className="flex flex-col gap-4">
            <Button type="submit" disabled={loading} className="w-full h-11 font-semibold">
              {loading ? <Loader2 className="animate-spin mr-2" size={16} /> : null}
              {loading ? "Ingresando..." : "Iniciar Sesion"}
            </Button>
            <p className="text-xs text-center text-muted-foreground">
              No tienes cuenta?{" "}
              <Link href="/auth/register" className="text-primary font-semibold hover:underline">
                Registrarse
              </Link>
            </p>
          </CardFooter>
        </form>
      </Card>
    </div>
  );
}
