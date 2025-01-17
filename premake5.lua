project "GLFW"
	kind "StaticLib"
	language "C"

	targetdir("%{wks.location}/" .. outputdir .. "/%{prj.name}")
    objdir("%{wks.location}/" .. outputdir .. "/.int/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c",
		"src/platform.c",

		 -- later synchronize glfw/glfw repository
		"src/null_window.c",
		"src/null_monitor.c",
		"src/null_joystick.c",
		"src/null_init.c",
	}
	filter "system:linux"
		pic "On"

		systemversion "latest"
		staticruntime "On"

		files
		{
			"src/x11_init.c",
			"src/linux_joystick.c",
			"src/x11_monitor.c",
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/x11_window.c",
			"src/posix_module.c",
			"src/glx_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/xkb_unicode.c",
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/win32_module.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"