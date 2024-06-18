set -e
ORIG_VERSION=18
MAJOR_VERSION=18 # 8.0.1
REV=`ls -1 *${ORIG_VERSION}_${MAJOR_VERSION}*~+*xz | tail -1|perl -ne 'print "$1\n" if /~\+(.*)\.orig/;'  | sort -ru`

VERSION=$REV

if test -z "$VERSION"; then
	echo "Could not find the version"
	exit 0
fi
LLVM_ARCHIVE=llvm-toolchain-${ORIG_VERSION}_$MAJOR_VERSION~+$VERSION.orig.tar.xz
echo "unpack of $LLVM_ARCHIVE"
tar Jxf $LLVM_ARCHIVE
cd llvm-toolchain-${ORIG_VERSION}_$MAJOR_VERSION~+$VERSION/

VER_FOUND=$(grep "LLVM_VERSION_MAJOR " llvm/CMakeLists.txt|awk '{print $2}'|cut -d\) -f1)
if test "${MAJOR_VERSION}" != "$VER_FOUND" -a "${MAJOR_VERSION}.0.0" != "$VER_FOUND" -a "${MAJOR_VERSION}.0.0git" != "$VER_FOUND" -a "${MAJOR_VERSION}git" != "$VER_FOUND"; then
    echo "Mismatch of version"
    echo "Expected $MAJOR_VERSION / Found $VER_FOUND"
    echo "Update unpack.sh"
    exit 1
fi

cp -R ../$ORIG_VERSION/debian .
QUILT_PATCHES=debian/patches/ quilt push -a --fuzz=0
