import os
BASE = r"F:
ano-everything\mini-everything-math. mini-point-set-topology\mini-stone-cech-compactification\MiniStoneCechCompactification"
def w(rel, content):
    path = os.path.join(BASE, rel)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Wrote {rel}")

print("Gen script header ready")