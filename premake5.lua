project "DirectXTK"
	kind "StaticLib"
	language "C++"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	pchheader "pch.h"
    pchsource "Src/pch.cpp"
	
	files
	{
	  "**.h",
	  "**.inl",
	  "**.cpp"
		
	}
	removefiles
	{
		"Audio/**.*",
		"XWBTool/**.*",
		"**/Xbox*.*"
	}
	
	defines
	{
		_WIN7_PLATFORM_UPDATE,
		_LIB,
		D3DXFX_LARGEADDRESS_HANDLE,
	   _CRT_STDIO_ARBITRARY_WIDE_SPECIFIERS
	}
	
	includedirs
   {
		"Inc"
    }

    -- Enable SSE2 vector processing
    vectorextensions "SSE"
	
	floatingpoint "Fast"
	
--	disablewarnings {"4711", "26812", "5045"}
	warnings "Off"

	
	
	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"


	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
