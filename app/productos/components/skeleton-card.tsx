export function SkeletonCard() {
  return (
    <div className="p-3.5 space-y-2 animate-pulse">
      <div className="flex items-center justify-between">
        <div className="h-5 w-24 rounded bg-secondary" />
        <div className="h-5 w-16 rounded bg-secondary" />
      </div>
      <div className="h-4 w-3/4 rounded bg-secondary" />
      <div className="h-3 w-1/2 rounded bg-secondary" />
    </div>
  );
}