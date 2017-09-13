projectPath=/Users/liuzhimin/Dropbox/Personal?Code/Project
thearchviePath=/Users/liuzhimin/Desktop
ipaPath=/Users/liuzhimin/Desktop
projectname=PackageProject
resourcefolder=res_dev
version=$1

cd $projectPath

#product bundle identifier change
sed -i '' 's/com.xxx.xxx/com.xcoderliu.iosapp/g' ${projectname}.xcodeproj/project.pbxproj

######copy Dev file######
echo "😀  😀  😀  i will start for development package!"
echo "***************** copy Dev public file start *****************"

cp -rf $projectPath/$resourcefolder/AppIcon.appiconset $projectPath/ProjectClient/Images.xcassets

cp -rf $projectPath/$resourcefolder/InfoPlist.strings/*.lproj $projectPath/ProjectClient/

cp -rf $projectPath/$resourcefolder/Localizable.strings/*.lproj $projectPath/Resources/

cp -rf $projectPath/$resourcefolder/Multiversion  $projectPath/ProjectClient/Images.xcassets

cp -rf $projectPath/$resourcefolder/ProjectClient-InfoDev.plist  $projectPath/ProjectClient/ProjectClient-Info.plist

cp -rf $projectPath/$resourcefolder/configDev.xml  $projectPath/ProjectClient/config.xml

cp -rf $projectPath/$resourcefolder/ClientMgrCfgDev.xml  $projectPath/ProjectClient/meetingMgrCfg.xml

echo "***************** copy Dev over *****************"


######start Dev bulild######
echo "***************** start clean Dev workspace *****************"

xcodebuild clean

rm -rf $thearchviePath/ProjectApp.xcarchive

rm -rf $thearchviePath/ProjectDev.xcarchive

rm -rf $thearchviePath/ProjectIntranet.xcarchive

rm -rf $ipaPath/Project_for_iOS_${version}_test.ipa

rm -rf $ipaPath/Project_for_iOS_${version}_appstore.ipa

rm -rf $ipaPath/Project_for_iOS_${version}_appstore_test.ipa

xcodebuild -project $projectname.xcodeproj -scheme $projectname -configuration Release clean

echo "***************** clean Dev workspace over *****************"

echo "***************** start build Dev workspace *****************"

xcodebuild -project $projectname.xcodeproj -scheme $projectname -configuration Release

echo "***************** build Dev workspace over *****************"

echo "***************** start export Dev archive *****************"

xcodebuild -project $projectname.xcodeproj -scheme $projectname archive -archivePath $thearchviePath/ProjectDev.xcarchive

echo "***************** export Dev archive over *****************"

echo "***************** start export Dev ipa app *****************"

xcodebuild -exportArchive -archivePath $thearchviePath/ProjectDev.xcarchive -exportPath $ipaPath -exportOptionsPlist projectDev.plist

mv $ipaPath/ProjectClient.ipa $ipaPath/Project_for_iOS_ ${version}_test.ipa

echo "***************** export Dev ipa over *****************"


###### Intranet test package ######
echo "😂  😂  😂  now Intranet test package!"
cp -rf $projectPath/$resourcefolder/configIntranet.xml  $projectPath/ProjectClient/config.xml

cp -rf $projectPath/$resourcefolder/meetingMgrCfgIntranet.xml  $projectPath/ProjectClient/meetingMgrCfg.xml

#xcodebuild -project $projectname.xcodeproj -scheme $projectname -configuration Release

xcodebuild -project $projectname.xcodeproj -scheme $projectname archive -archivePath $thearchviePath/ProjectIntranet.xcarchive

xcodebuild -exportArchive -archivePath $thearchviePath/ProjectDev.xcarchive -exportPath $ipaPath -exportOptionsPlist projectDev.plist

mv $ipaPath/ProjectClient.ipa $ipaPath/Project_for_iOS_${version}_Intranet_test.ipa

######copy App file######
echo "😂  😂  😂  then App & APP test package!"
echo "***************** copy App public file start *****************"

cp -rf $projectPath/$resourcefolder/configApp.xml  $projectPath/ProjectClient/config.xml

cp -rf $projectPath/$resourcefolder/meetingMgrCfgApp.xml  $projectPath/ProjectClient/meetingMgrCfg.xml

cp -rf $projectPath/$resourcefolder/ProjectClient-InfoApp.plist  $projectPath/ProjectClient/ProjectClient-Info.plist

echo "***************** copy App over *****************"

echo "***************** start build App workspace *****************"

#xcodebuild -project $projectname.xcodeproj -scheme $projectname -configuration Release

echo "***************** build App workspace over *****************"

echo "***************** start export App archive *****************"

xcodebuild -project $projectname.xcodeproj -scheme $projectname archive -archivePath $thearchviePath/ProjectApp.xcarchive

echo "***************** export App archive over *****************"

echo "***************** start export App ipa app *****************"

xcodebuild -exportArchive -archivePath $thearchviePath/ProjectDev.xcarchive -exportPath $ipaPath -exportOptionsPlist projectRelease.plist

mv $ipaPath/ProjectClient.ipa $ipaPath/Project_for_iOS_${version}_appstore.ipa

xcodebuild -exportArchive -archivePath $thearchviePath/ProjectDev.xcarchive -exportPath $ipaPath -exportOptionsPlist projectDev.plist

mv $ipaPath/ProjectClient.ipa $ipaPath/Project_for_iOS_${version}_appstore_test.ipa

echo "***************** export App ipa over *****************"
