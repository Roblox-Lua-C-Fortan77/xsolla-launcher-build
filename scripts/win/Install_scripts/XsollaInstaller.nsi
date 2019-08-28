; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Xsolla_launcher" ;Launcher name in the Start menu. The value must be duplicated in the "product_name" parameter in the launcher/win/config.json file. 
!define PRODUCT_PUBLISHER "Xsolla"
!define PRODUCT_VERSION "" ;Version shown in the Launcher installer window. 
!define PRODUCT_WEB_SITE "xsolla.com" ;Game URL opened from the shortcut in the Start menu. 
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${PRODUCT_NAME}"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define LAUNCHER_REGKEY "${PRODUCT_NAME}_XsollaLauncher"

; MUI 1.67 compatible ------
!include "MUI.nsh"
!include "StrFunc.nsh"

${StrRep}

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "launcherIcon.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico" ;Uninstallation icon.

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Directory page
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE "DirectoryLeave"
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\launcher.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "bin\Xsolla_Launcher_installer.exe" ;Launcher installer name.
InstallDir "$LOCALAPPDATA\${PRODUCT_NAME}" ;Default directory for Launcher installation.
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Function isEmptyDir
  Exch $0
  Push $1
  FindFirst $0 $1 "$0\*.*"
  strcmp $1 "." 0 _notempty
    FindNext $0 $1
    strcmp $1 ".." 0 _notempty
      ClearErrors
      FindNext $0 $1
      IfErrors 0 _notempty
        FindClose $0
        Pop $1
        StrCpy $0 1
        Exch $0
        goto _end
     _notempty:
       FindClose $0
       ClearErrors
       Pop $1
       StrCpy $0 0
       Exch $0
  _end:
FunctionEnd

Function DirectoryLeave
  ${If} ${FileExists} "$InstDir\launcher.exe"
    Return
  ${EndIf}
  
  Push $InstDir
	Call isEmptyDir
  Pop $0
  
  ${If} $0 == 1
	Return
  ${Else}
      ${If} ${FileExists} "$InstDir"
		MessageBox MB_OK `"$InstDir" is not empty. Choose another directory`
		Abort
	  ${EndIf}
  ${EndIf}
FunctionEnd

!define SHCNE_ASSOCCHANGED 0x08000000
!define SHCNF_IDLIST 0
 
Function RefreshShellIcons
  ; By jerome tremblay - april 2003
  System::Call 'shell32.dll::SHChangeNotify(i, i, i, i) v \
  (${SHCNE_ASSOCCHANGED}, ${SHCNF_IDLIST}, 0, 0)'
FunctionEnd

Section "-MainSection" SEC01
  SetOutPath "$INSTDIR"
  ExecWait '"cmd.exe" /C icacls "$INSTDIR" /grant:r %userdomain%\%username%:f /t /c'
  
  SetOverwrite ifnewer
  File  /r "data"
  File  /r "fonts"
  File  /r "imageformats"
  File  /r "img"
  File  /r "platforms"
  File  /r "Qt"
  File  /r "QtGraphicalEffects"
  File  /r "QtQuick"
  File  /r "QtQuick.2"
  File  /r "QtWebEngine"
  File  /r "translations"
  File "boost_atomic-vc140-mt-x64-1_68.dll"
  File "boost_chrono-vc140-mt-x64-1_68.dll"
  File "boost_date_time-vc140-mt-x64-1_68.dll"
  File "boost_random-vc140-mt-x64-1_68.dll"
  File "boost_system-vc140-mt-x64-1_68.dll"
  File "boost_thread-vc140-mt-x64-1_68.dll"
  File "libcrypto-1_1-x64.dll"
  File "libssl-1_1-x64.dll"
  File "7za.exe"
  File "7z.dll"
  File "crashrpt.dll"
  File "config.json"
  File "UIStyle.json"
  File "local_theme.json"
  File "d3dcompiler_47.dll"
  File "dbghelp.dll"
  File "XsollaGUS.dll"
  File "icudtl.dat"
  File "launcher.exe"
  File "launcherIcon.ico"
  File "libeay32.dll"
  File "libEGL.dll"
  File "libGLESv2.dll"
  File "msvcp140.dll"
  File "ucrtbase.dll"
  File "vcruntime140.dll"
  File "Qlib7zVS.dll"
  File "Qt5Concurrent.dll"
  File "Qt5Core.dll"
  File "Qt5Gui.dll"
  File "Qt5Network.dll"
  File "Qt5Positioning.dll"
  File "Qt5Qml.dll"
  File "Qt5Quick.dll"
  File "Qt5QuickControls2.dll"
  File "Qt5QuickTemplates2.dll"
  File "Qt5WebChannel.dll"
  File "Qt5WebEngine.dll"
  File "Qt5WebEngineCore.dll"
  File "Qt5WebSockets.dll"
  File "Qt5Widgets.dll"
  File "Qt5Xml.dll"
  File "Qt5Svg.dll"
  File "qtwebengine_resources.pak"
  File "qtwebengine_resources_100p.pak"
  File "qtwebengine_resources_200p.pak"
  File "QtWebEngineProcess.exe"
  File "rsync.dll"
  File "sendrpt.exe"
  File "ssleay32.dll"
  File "steam_api64.dll"
  File "SnailLauncherSDK.dll"
  File "torrent.dll"
  File "UpdProgram.exe"
  File "XsollaDownloader.dll"
  File "XsollaAuth.dll"
  File "XsollaCore.dll"
  File "Changelog.txt"
  File "qwebchannel.js"
  File "XsollaRPCServer.dll"
  File "PocoFoundation64.dll"
  File "PocoNet64.dll"
  
  File "api-ms-win-crt-utility-l1-1-0.dll"            
  File "api-ms-win-core-console-l1-1-0.dll"           
  File "api-ms-win-core-datetime-l1-1-0.dll"          
  File "api-ms-win-core-debug-l1-1-0.dll"             
  File "api-ms-win-core-errorhandling-l1-1-0.dll"     
  File "api-ms-win-core-file-l1-1-0.dll"              
  File "api-ms-win-core-file-l1-2-0.dll"              
  File "api-ms-win-core-file-l2-1-0.dll"              
  File "api-ms-win-core-handle-l1-1-0.dll"            
  File "api-ms-win-core-heap-l1-1-0.dll"              
  File "api-ms-win-core-interlocked-l1-1-0.dll"       
  File "api-ms-win-core-libraryloader-l1-1-0.dll"     
  File "api-ms-win-core-localization-l1-2-0.dll"      
  File "api-ms-win-core-memory-l1-1-0.dll"            
  File "api-ms-win-core-namedpipe-l1-1-0.dll"         
  File "api-ms-win-core-processenvironment-l1-1-0.dll"
  File "api-ms-win-core-processthreads-l1-1-0.dll"    
  File "api-ms-win-core-processthreads-l1-1-1.dll"    
  File "api-ms-win-core-profile-l1-1-0.dll"           
  File "api-ms-win-core-rtlsupport-l1-1-0.dll"        
  File "api-ms-win-core-string-l1-1-0.dll"            
  File "api-ms-win-core-synch-l1-1-0.dll"             
  File "api-ms-win-core-synch-l1-2-0.dll"             
  File "api-ms-win-core-sysinfo-l1-1-0.dll"           
  File "api-ms-win-core-timezone-l1-1-0.dll"          
  File "api-ms-win-core-util-l1-1-0.dll"              
  File "api-ms-win-crt-conio-l1-1-0.dll"              
  File "api-ms-win-crt-convert-l1-1-0.dll"            
  File "api-ms-win-crt-environment-l1-1-0.dll"        
  File "api-ms-win-crt-filesystem-l1-1-0.dll"         
  File "api-ms-win-crt-heap-l1-1-0.dll"               
  File "api-ms-win-crt-locale-l1-1-0.dll"             
  File "api-ms-win-crt-math-l1-1-0.dll"               
  File "api-ms-win-crt-multibyte-l1-1-0.dll"          
  File "api-ms-win-crt-private-l1-1-0.dll"            
  File "api-ms-win-crt-process-l1-1-0.dll"            
  File "api-ms-win-crt-runtime-l1-1-0.dll"            
  File "api-ms-win-crt-stdio-l1-1-0.dll"              
  File "api-ms-win-crt-string-l1-1-0.dll"             
  File "api-ms-win-crt-time-l1-1-0.dll"  
  File "aws-cpp-sdk-core.dll"  
  File "aws-cpp-sdk-s3.dll"
  File "aws-cpp-sdk-transfer.dll"

  SetOutPath "$INSTDIR"

  File "vc_redist.x64.exe"
  DetailPrint "Running vcredist setup..."
  ExecWait "$INSTDIR\vc_redist.x64.exe /q /norestart"
  DetailPrint "Finished vcredist setup"

  ${StrRep} $0 "$INSTDIR" "\" "/"

  SetShellVarContext Current
  CreateDirectory "$SMPROGRAMS\${PRODUCT_NAME}"
  CreateDirectory "$SMPROGRAMS\${PRODUCT_NAME}\Games"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" "$INSTDIR\launcher.exe" "" "$INSTDIR\launcherIcon.ico"
  CreateShortCut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\launcher.exe" "" "$INSTDIR\launcherIcon.ico"
  SimpleFC::AddApplication "${PRODUCT_NAME}: launcher" "$INSTDIR\launcher.exe" 0 2 "" 1
  Call RefreshShellIcons
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\Official Site.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  SetShellVarContext Current
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Official Site.lnk" "$INSTDIR\Official Site.url" "" "$INSTDIR\launcherIcon.ico"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Uninstall.lnk" "$INSTDIR\uninst.exe"
  Call RefreshShellIcons
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\launcher.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\launcher.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Section Uninstall
  SetOutPath $INSTDIR
  ExecWait "$INSTDIR\launcher.exe -uninstall_all_games"
  SetOutPath "$INSTDIR\.."
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\boost_atomic-vc140-mt-x64-1_68.dll"
  Delete "$INSTDIR\boost_chrono-vc140-mt-x64-1_68.dll"
  Delete "$INSTDIR\boost_date_time-vc140-mt-x64-1_68.dll"
  Delete "$INSTDIR\boost_random-vc140-mt-x64-1_68.dll"
  Delete "$INSTDIR\boost_system-vc140-mt-x64-1_68.dll"
  Delete "$INSTDIR\boost_thread-vc140-mt-x64-1_68.dll"
  Delete "$INSTDIR\libcrypto-1_1-x64.dll"
  Delete "$INSTDIR\libssl-1_1-x64.dll"
  Delete "$INSTDIR\7za.exe"
  Delete "$INSTDIR\7z.dll"
  Delete "$INSTDIR\crashrpt.dll"
  Delete "$INSTDIR\config.json"
  Delete "$INSTDIR\UIStyle.json"
  Delete "$INSTDIR\local_theme.json"
  Delete "$INSTDIR\d3dcompiler_47.dll"
  Delete "$INSTDIR\dbghelp.dll"
  Delete "$INSTDIR\XsollaGUS.dll"
  Delete "$INSTDIR\icudtl.dat"
  Delete "$INSTDIR\launcher.exe"
  Delete "$INSTDIR\launcherIcon.ico"
  Delete "$INSTDIR\libeay32.dll"
  Delete "$INSTDIR\libEGL.dll"
  Delete "$INSTDIR\libGLESv2.dll"
  Delete "$INSTDIR\msvcp140.dll"
  Delete "$INSTDIR\ucrtbase.dll"
  Delete "$INSTDIR\vcruntime140.dll"
  Delete "$INSTDIR\Qlib7zVS.dll"
  Delete "$INSTDIR\Qt5Concurrent.dll"
  Delete "$INSTDIR\Qt5Core.dll"
  Delete "$INSTDIR\Qt5Gui.dll"
  Delete "$INSTDIR\Qt5Network.dll"
  Delete "$INSTDIR\Qt5Positioning.dll"
  Delete "$INSTDIR\Qt5Qml.dll"
  Delete "$INSTDIR\Qt5Quick.dll"
  Delete "$INSTDIR\Qt5QuickControls2.dll"
  Delete "$INSTDIR\Qt5QuickTemplates2.dll"
  Delete "$INSTDIR\Qt5WebChannel.dll"
  Delete "$INSTDIR\Qt5WebEngine.dll"
  Delete "$INSTDIR\Qt5WebEngineCore.dll"
  Delete "$INSTDIR\Qt5WebSockets.dll"
  Delete "$INSTDIR\Qt5Widgets.dll"
  Delete "$INSTDIR\Qt5Xml.dll"
  Delete "$INSTDIR\Qt5Svg.dll"
  Delete "$INSTDIR\qtwebengine_resources.pak"
  Delete "$INSTDIR\qtwebengine_resources_100p.pak"
  Delete "$INSTDIR\qtwebengine_resources_200p.pak"
  Delete "$INSTDIR\QtWebEngineProcess.exe"
  Delete "$INSTDIR\rsync.dll"
  Delete "$INSTDIR\sendrpt.exe"
  Delete "$INSTDIR\ssleay32.dll"
  Delete "$INSTDIR\steam_api64.dll"
  Delete "$INSTDIR\SnailLauncherSDK.dll"
  Delete "$INSTDIR\torrent.dll"
  Delete "$INSTDIR\UpdProgram.exe"
  Delete "$INSTDIR\XsollaDownloader.dll"
  Delete "$INSTDIR\XsollaAuth.dll"
  Delete "$INSTDIR\XsollaCore.dll"
  Delete "$INSTDIR\Changelog.txt"
  Delete "$INSTDIR\qwebchannel.js"
  Delete "$INSTDIR\XsollaRPCServer.dll"
  Delete "$INSTDIR\PocoFoundation64.dll"
  Delete "$INSTDIR\PocoNet64.dll"
  
  Delete "$INSTDIR\api-ms-win-crt-utility-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-console-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-datetime-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-debug-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-errorhandling-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-file-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-file-l1-2-0.dll"
  Delete "$INSTDIR\api-ms-win-core-file-l2-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-handle-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-heap-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-interlocked-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-libraryloader-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-localization-l1-2-0.dll"
  Delete "$INSTDIR\api-ms-win-core-memory-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-namedpipe-l1-1-0.dll"         
  Delete "$INSTDIR\api-ms-win-core-processenvironment-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-processthreads-l1-1-0.dll"    
  Delete "$INSTDIR\api-ms-win-core-processthreads-l1-1-1.dll"    
  Delete "$INSTDIR\api-ms-win-core-profile-l1-1-0.dll"           
  Delete "$INSTDIR\api-ms-win-core-rtlsupport-l1-1-0.dll"        
  Delete "$INSTDIR\api-ms-win-core-string-l1-1-0.dll"            
  Delete "$INSTDIR\api-ms-win-core-synch-l1-1-0.dll"             
  Delete "$INSTDIR\api-ms-win-core-synch-l1-2-0.dll"             
  Delete "$INSTDIR\api-ms-win-core-sysinfo-l1-1-0.dll"           
  Delete "$INSTDIR\api-ms-win-core-timezone-l1-1-0.dll"          
  Delete "$INSTDIR\api-ms-win-core-util-l1-1-0.dll"              
  Delete "$INSTDIR\api-ms-win-crt-conio-l1-1-0.dll"              
  Delete "$INSTDIR\api-ms-win-crt-convert-l1-1-0.dll"            
  Delete "$INSTDIR\api-ms-win-crt-environment-l1-1-0.dll"        
  Delete "$INSTDIR\api-ms-win-crt-filesystem-l1-1-0.dll"         
  Delete "$INSTDIR\api-ms-win-crt-heap-l1-1-0.dll"               
  Delete "$INSTDIR\api-ms-win-crt-locale-l1-1-0.dll"             
  Delete "$INSTDIR\api-ms-win-crt-math-l1-1-0.dll"               
  Delete "$INSTDIR\api-ms-win-crt-multibyte-l1-1-0.dll"          
  Delete "$INSTDIR\api-ms-win-crt-private-l1-1-0.dll"            
  Delete "$INSTDIR\api-ms-win-crt-process-l1-1-0.dll"            
  Delete "$INSTDIR\api-ms-win-crt-runtime-l1-1-0.dll"            
  Delete "$INSTDIR\api-ms-win-crt-stdio-l1-1-0.dll"              
  Delete "$INSTDIR\api-ms-win-crt-string-l1-1-0.dll"             
  Delete "$INSTDIR\api-ms-win-crt-time-l1-1-0.dll" 

  Delete "$INSTDIR\aws-cpp-sdk-core.dll"  
  Delete "$INSTDIR\aws-cpp-sdk-s3.dll"
  Delete "$INSTDIR\aws-cpp-sdk-transfer.dll"
  
  RMDir /r "$INSTDIR\bearer"
  RMDir /r "$INSTDIR\data"
  RMDir /r "$INSTDIR\fonts"
  RMDir /r "$INSTDIR\imageformats"
  RMDir /r "$INSTDIR\img"
  RMDir /r "$INSTDIR\platforms"
  RMDir /r "$INSTDIR\Qt"
  RMDir /r "$INSTDIR\QtGraphicalEffects"
  RMDir /r "$INSTDIR\QtQuick"
  RMDir /r "$INSTDIR\QtQuick.2"
  RMDir /r "$INSTDIR\QtWebEngine"
  RMDir /r "$INSTDIR\translations"
  RMDir /r "$INSTDIR"

  SetShellVarContext Current
  Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
  SetOutPath "$TEMP"
  RMDir /r "$SMPROGRAMS\${PRODUCT_NAME}"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  DeleteRegKey HKCU "SOFTWARE\${PRODUCT_PUBLISHER}\${LAUNCHER_REGKEY}"
  DeleteRegKey HKLM "SOFTWARE\${PRODUCT_PUBLISHER}\${LAUNCHER_REGKEY}"
  DeleteRegKey HKLM "SOFTWARE\WOW6432node\${PRODUCT_PUBLISHER}\${LAUNCHER_REGKEY}"

  SetAutoClose true
SectionEnd

Function un.onInit
  MessageBox MB_YESNO "${PRODUCT_NAME} will uninstall. Continue?" IDYES NoAbort
    Abort ; causes uninstaller to quit.
  NoAbort:
FunctionEnd

Function un.onUninstSuccess
  MessageBox MB_OK "You have successfully uninstalled ${PRODUCT_NAME}."
FunctionEnd
