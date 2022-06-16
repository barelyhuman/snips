# Multiple GoogleService Info plist setup

This is specifically for iOS.

1. Setup folders for the configs, through xcode
2. Add in the dev and prod configs as necessary and **do not** set any default
   app targets for the files
3. Add the below snippet into the Build Phases for the target

- Running with the Debug configuration will use the dev file
- Running with the Release configuration will use the prod file

```sh
GOOGLESERVICE_INFO_PLIST=GoogleService-Info.plist

PATH_TO_CONFIG_DEV=$SRCROOT/Firebase/Dev/$GOOGLESERVICE_INFO_PLIST
PATH_TO_CONFIG_PROD=$SRCROOT/Firebase/Prod/$GOOGLESERVICE_INFO_PLIST

BUILD_APP_DIR=${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app

if [ "${CONFIGURATION}" == "Release" ]
then
    echo "Using ${GOOGLESERVICE_INFO_PROD}"
    cp "${PATH_TO_CONFIG_PROD}" "$BUILD_APP_DIR/$PLIST_DESTINATION"
else
    echo "Using ${GOOGLESERVICE_INFO_DEV}"
        cp "${PATH_TO_CONFIG_DEV}" "$BUILD_APP_DIR/$PLIST_DESTINATION"
fi
```
