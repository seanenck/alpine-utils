#!/bin/sh -e
VERSION=0.18.0
FILE="$PKGS_WD/$VERSION.gopls.tar.gz"
HASH="2fec859"

download-and-check \
  -u "https://github.com/golang/tools/archive/gopls/v$VERSION.tar.gz" \
  -f "$FILE" \
  -h "$HASH" \
  -t "gopls"

tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/tools-gopls-v$VERSION"
MODERNIZE="$PKGS_BIN/gomodernize"
{
  echo "#!/bin/sh"
  echo "go run golang.org/x/tools/gopls/internal/analysis/modernize/cmd/modernize@v$VERSION -test ./... 2>&1"
} > "$MODERNIZE"
chmod 755 "$MODERNIZE"
(cd "$TO/gopls" && go build -buildmode=pie -mod=readonly -modcacherw -ldflags "-compressdwarf=false" -o gopls)
(cd "$TO/gopls" && install -Dm755 "gopls" "$PKGS_BIN/gopls")
rm -rf "$TO"
