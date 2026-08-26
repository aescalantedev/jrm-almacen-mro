"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";

export default function MovimientosPage() {
  const router = useRouter();

  useEffect(() => {
    router.replace("/movimientos/salida");
  }, [router]);

  return null;
}
