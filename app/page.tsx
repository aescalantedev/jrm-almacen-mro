"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";
import { useAuth } from "./inventario/hooks/use-auth";

export default function RootPage() {
  const router = useRouter();
  const { user } = useAuth();

  useEffect(() => {
    if (!user) return;
    if (user.rol === "admin" || user.rol === "auditor") {
      router.replace("/dashboard");
    } else {
      router.replace("/inventario");
    }
  }, [user, router]);

  return null;
}
