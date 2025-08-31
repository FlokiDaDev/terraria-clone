#pragma once

#include "Log/Log.h"
#include "Application/Application.h"

#ifdef APPLICATION
namespace Engine
{
	extern Application* CreateApplication();
}

	int main(int argc, char* argv[])
	{
		Engine::Logger::Init();
		auto app = Engine::CreateApplication();
		app->Run();
		delete app;
	}
#endif
