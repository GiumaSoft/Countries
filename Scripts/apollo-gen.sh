# Type a script or drag a script file from your workspace to insert its path.

if [ "${ENABLE_PREVIEWS}" = "YES" ]; then
  echo >&2 "Apollo script is not running in preview mode."
  exit 0;
fi

# Don't run this during index builds
if [ $ACTION = "indexbuild" ]; then exit 0; fi

# Grab a reference to the directory where scripts are checked out
SCRIPT_PATH="${SRCROOT}/Tuist/Dependencies/SwiftPackageManager/.build/checkouts/apollo-ios/scripts"

if [ -z "${SCRIPT_PATH}" ]; then
    echo >&2 "error: Couldn't find the CLI script in your checked out SPM packages; make sure to add the framework to your project."
    exit 1
fi

cd "${SRCROOT}/Sources"

"${SCRIPT_PATH}"/run-bundled-codegen.sh schema:download --endpoint=https://countries.trevorblades.com/graphql ./GraphQL/Schema/schema.json

"${SCRIPT_PATH}"/run-bundled-codegen.sh codegen:generate --target=swift --includes=./**/*.graphql --localSchemaFile=./GraphQL/Schema/schema.json ./GraphQL/API+Generated.swift

