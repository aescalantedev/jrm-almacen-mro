"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { Warehouse, Eye, EyeOff, Loader2, Clock, CheckCircle2, ArrowRight } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { toast } from "sonner";

export default function RegisterPage() {
  const router = useRouter();
  const [nombre, setNombre] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPass, setShowPass] = useState(false);
  const [loading, setLoading] = useState(false);
  const [registered, setRegistered] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    try {
      const res = await fetch("/api/auth/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nombre, email, password, rol: "almacenero" }),
      });
      const data = await res.json();
      if (!res.ok) {
        toast.error(data.error || "Error al registrar");
        setLoading(false);
        return;
      }
      setRegistered(true);
      toast.success("Registro completado con éxito");
    } catch {
      toast.error("Error de conexión");
      setLoading(false);
    }
  };

  if (registered) {
    return (
      <div className="w-full max-w-sm mx-auto px-4">
        <div className="flex flex-col items-center mb-6">
          <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-amber-500/10 text-amber-500 shadow-lg shadow-amber-500/10 mb-4 border border-amber-500/20">
            <Clock className="h-7 w-7" />
          </div>
          <h1 className="text-2xl font-bold tracking-tight text-center">Cuenta Creada</h1>
          <p className="text-xs text-muted-foreground mt-1">Pendiente de Aprobación</p>
        </div>

        <Card className="shadow-xl border-border/50">
          <CardHeader className="text-center pb-2">
            <div className="mx-auto flex h-10 w-10 items-center justify-center rounded-full bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 mb-2">
              <CheckCircle2 className="h-6 w-6" />
            </div>
            <CardTitle className="text-lg font-bold">¡Registro Exitoso!</CardTitle>
            <CardDescription className="text-xs">
              Hola <strong>{nombre}</strong>, tu cuenta ha sido registrada con el correo <strong>{email}</strong>.
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-3 text-center text-xs text-muted-foreground pt-2">
            <div className="p-3.5 bg-blue-500/10 border border-blue-500/20 rounded-xl text-blue-800 dark:text-blue-300 text-left space-y-1">
              <div className="font-semibold flex items-center gap-1.5 text-xs">
                <Clock className="h-3.5 w-3.5" />
                Verifica tu correo
              </div>
              <p className="text-[11px] leading-relaxed">
                Por motivos de seguridad, te hemos enviado un <strong>enlace de verificación</strong> a tu correo. Revisa tu bandeja de entrada y haz clic en el enlace antes de iniciar sesión.
              </p>
            </div>
          </CardContent>
          <CardFooter className="flex flex-col gap-3 pt-2">
            <Button
              type="button"
              onClick={() => router.replace("/auth/login")}
              className="w-full h-11 font-semibold rounded-xl gap-2"
            >
              Ir al Inicio de Sesión
              <ArrowRight className="h-4 w-4" />
            </Button>
          </CardFooter>
        </Card>
      </div>
    );
  }

  return (
    <div className="w-full max-w-sm mx-auto px-4">
      <div className="flex flex-col items-center mb-8">
        <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-primary shadow-lg shadow-primary/20 mb-4">
          <Warehouse className="h-7 w-7 text-primary-foreground" />
        </div>
        <h1 className="text-2xl font-bold tracking-tight">Crear Cuenta</h1>
        <p className="text-sm text-muted-foreground mt-1">Sistema de Inventario MRO</p>
      </div>

      <Card className="shadow-xl border-border/50">
        <CardHeader className="space-y-1 pb-4">
          <CardTitle className="text-xl font-bold">Registro</CardTitle>
          <CardDescription>Complete sus datos para crear una cuenta</CardDescription>
        </CardHeader>
        <form onSubmit={handleSubmit}>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="nombre" className="text-xs font-semibold">Nombre Completo</Label>
              <Input id="nombre" value={nombre} onChange={(e) => setNombre(e.target.value)} placeholder="Ej: Juan Perez" required className="h-11" />
            </div>
            <div className="space-y-2">
              <Label htmlFor="email" className="text-xs font-semibold">Correo Electrónico</Label>
              <Input id="email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Ej: admin@empresa.com" required className="h-11" />
            </div>
            <div className="space-y-2">
              <Label htmlFor="password" className="text-xs font-semibold">Contraseña</Label>
              <div className="relative">
                <Input id="password" type={showPass ? "text" : "password"} value={password} onChange={(e) => setPassword(e.target.value)} placeholder="Mínimo 4 caracteres" required minLength={4} className="h-11 pr-10" />
                <button type="button" onClick={() => setShowPass(!showPass)} className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground">
                  {showPass ? <EyeOff size={16} /> : <Eye size={16} />}
                </button>
              </div>
            </div>
          </CardContent>
          <CardFooter className="flex flex-col gap-4">
            <Button type="submit" disabled={loading} className="w-full h-11 font-semibold">
              {loading ? <Loader2 className="animate-spin mr-2" size={16} /> : null}
              {loading ? "Creando..." : "Crear Cuenta"}
            </Button>
            <p className="text-xs text-center text-muted-foreground">
              ¿Ya tienes cuenta?{" "}
              <Link href="/auth/login" className="text-primary font-semibold hover:underline">
                Iniciar Sesión
              </Link>
            </p>
          </CardFooter>
        </form>
      </Card>
    </div>
  );
}
