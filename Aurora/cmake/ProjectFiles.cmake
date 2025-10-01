
#
# RuntimeCompiler Source
#

set(RuntimeCompiler_Files
	"RuntimeCompiler/SimpleFileWatcher"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcher.cpp"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcher.h"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcherImpl.h"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcherLinux.cpp"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcherLinux.h"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcherOSX.cpp"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcherOSX.h"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcherWin32_AltImpl.h"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcherWin32.cpp"
	"RuntimeCompiler/SimpleFileWatcher/FileWatcherWin32.h"
	"RuntimeCompiler/AUArray.h"
	"RuntimeCompiler/BuildTool.cpp"
	"RuntimeCompiler/BuildTool.h"
	"RuntimeCompiler/CompileOptions.h"
	"RuntimeCompiler/Compiler_PlatformPosix.cpp"
	"RuntimeCompiler/Compiler_PlatformWindows.cpp"
	"RuntimeCompiler/Compiler.h"
	"RuntimeCompiler/FileChangeNotifier.cpp"
	"RuntimeCompiler/FileChangeNotifier.h"
	"RuntimeCompiler/FileSystemUtils.h"
	"RuntimeCompiler/ICompilerLogger.h"
	"RuntimeCompiler/IFileChangeNotifier.h"
)

if(UNIX)
	list(REMOVE_ITEM RuntimeCompiler_Files "RuntimeCompiler/Compiler_PlatformWindows.cpp")
	list(REMOVE_ITEM RuntimeCompiler_Files "RuntimeCompiler/SimpleFileWatcher/FileWatcherWin32.cpp")
	if(APPLE)
		list(REMOVE_ITEM RuntimeCompiler_Files "RuntimeCompiler/SimpleFileWatcher/FileWatcherLinux.cpp")
	else()
		list(REMOVE_ITEM RuntimeCompiler_Files "RuntimeCompiler/SimpleFileWatcher/FileWatcherOSX.cpp")
	endif()
else()
	list(REMOVE_ITEM RuntimeCompiler_Files "RuntimeCompiler/Compiler_PlatformPosix.cpp")
	list(REMOVE_ITEM RuntimeCompiler_Files "RuntimeCompiler/SimpleFileWatcher/FileWatcherOSX.cpp")
	list(REMOVE_ITEM RuntimeCompiler_Files "RuntimeCompiler/SimpleFileWatcher/FileWatcherLinux.cpp")
endif()

#
#
# RuntimeObjectSystem Source
#

set(RuntimeObjectSystem_Files
	"RuntimeObjectSystem/ObjectFactorySystem/ObjectFactorySystem.cpp"
	"RuntimeObjectSystem/ObjectFactorySystem/ObjectFactorySystem.h"
	"RuntimeObjectSystem/SimpleSerializer/SimpleSerializer.cpp"
	"RuntimeObjectSystem/SimpleSerializer/SimpleSerializer.h"
	"RuntimeObjectSystem/IObject.h"
	"RuntimeObjectSystem/IObjectFactorySystem.h"
	"RuntimeObjectSystem/IRuntimeObjectSystem.h"
	"RuntimeObjectSystem/ISimpleSerializer.h"
	"RuntimeObjectSystem/ObjectInterface.h"
	"RuntimeObjectSystem/ObjectInterfacePerModule.h"
	"RuntimeObjectSystem/ObjectInterfacePerModuleSource.cpp"
	"RuntimeObjectSystem/RuntimeInclude.h"
	"RuntimeObjectSystem/RuntimeLinkLibrary.h"
	"RuntimeObjectSystem/RuntimeObjectSystem_PlatformPosix.cpp"
	"RuntimeObjectSystem/RuntimeObjectSystem_PlatformWindows.cpp"
	"RuntimeObjectSystem/RuntimeObjectSystem.cpp"
	"RuntimeObjectSystem/RuntimeObjectSystem.h"
	"RuntimeObjectSystem/RuntimeProtector.h"
	"RuntimeObjectSystem/RuntimeSourceDependency.h"
	"RuntimeObjectSystem/RuntimeTracking.h"
)

if(UNIX)
	list(REMOVE_ITEM RuntimeObjectSystem_Files "RuntimeObjectSystem/RuntimeObjectSystem_PlatformWindows.cpp")
else()
	list(REMOVE_ITEM RuntimeObjectSystem_Files "RuntimeObjectSystem/RuntimeObjectSystem_PlatformPosix.cpp")
endif()

#
# Example applications
#

if(BUILD_EXAMPLES)
	#
	# ConsoleExample Source
	#
	aux_source_directory(Examples/ConsoleExample ConsoleExample_SRCS)
	#
	# SimpleTest Source
	#
	aux_source_directory(Examples/SimpleTest SimpleTest_SRCS)
	#
	# Renderer Source
	#
	aux_source_directory(Renderer Renderer_SRCS)
	#
	# Systems Source
	#
	#aux_source_directory(Systems Systems_SRCS)
	file(GLOB_RECURSE Systems_SRCS "Systems/*.cpp")
endif()
