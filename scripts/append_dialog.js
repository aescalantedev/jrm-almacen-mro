const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../app/productos/page.tsx');
let lines = fs.readFileSync(filePath, 'utf-8').split('\n');

// pop the last 3 lines assuming they are </div>, );, }
if (lines[lines.length - 1] === '}' || lines[lines.length - 1] === '') {
  while(lines[lines.length - 1].trim() === '' || lines[lines.length - 1].trim() === '}' || lines[lines.length - 1].trim() === ');' || lines[lines.length - 1].trim() === '</div>') {
    lines.pop();
  }
}

const dialogHTML = `
      {/* DIALOG DE CONFIRMACION DE ELIMINACION */}
      <AlertDialog open={deleteConfirmOpen} onOpenChange={setDeleteConfirmOpen}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>¿Eliminar productos?</AlertDialogTitle>
            <AlertDialogDescription>
              ¿Estás seguro de que deseas eliminar los {selectedSkus.length} productos seleccionados?
              Esta acción no se puede deshacer y borrará el historial de estos productos.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel disabled={deletingMultiple}>Cancelar</AlertDialogCancel>
            <AlertDialogAction 
              onClick={executeDeleteSelected}
              className="bg-destructive text-destructive-foreground hover:bg-destructive/90"
              disabled={deletingMultiple}
            >
              Eliminar
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}`;

lines.push(dialogHTML);

fs.writeFileSync(filePath, lines.join('\n'));
console.log("Appended dialog correctly");
