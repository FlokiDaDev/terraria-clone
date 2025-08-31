#pragma once

#include "Log/Log.h"

#ifndef _WIN64
#error "Only windows is supported!"
#endif

#pragma region Logging
#ifdef DEBUG
#define CORE_TRACE(...) Engine::Logger::GetCoreLogger()->trace(__VA_ARGS__)
#define CORE_DEBUG(...) Engine::Logger::GetCoreLogger()->debug(__VA_ARGS__)
#define CORE_WARN(...) Engine::Logger::GetCoreLogger()->warn(__VA_ARGS__)
#define CORE_ERROR(...) Engine::Logger::GetCoreLogger()->error(__VA_ARGS__)
#define CORE_CRITICAL(...) Engine::Logger::GetCoreLogger()->critical(__VA_ARGS__)
#define GAME_TRACE(...) Engine::Logger::GetGameLogger()->trace(__VA_ARGS__)
#define GAME_DEBUG(...) Engine::Logger::GetGameLogger()->debug(__VA_ARGS__)
#define GAME_WARN(...) Engine::Logger::GetGameLogger()->warn(__VA_ARGS__)
#define GAME_ERROR(...) Engine::Logger::GetGameLogger()->error(__VA_ARGS__)
#define GAME_CRITICAL(...) Engine::Logger::GetGameLogger()->critical(__VA_ARGS__)
#else
#define CORE_DEBUG(...)
#define CORE_WARN(...)
#define CORE_ERROR(...)
#define CORE_CRITICAL(...)
#define GAME_DEBUG(...)
#define GAME_WARN(...)
#define GAME_ERROR(...)
#define GAME_CRITICAL(...)
#endif
#pragma endregion

#pragma region Asserts
#ifdef DEBUG
#define CORE_ASSERT(cond, ...) { if (!(cond)) { CORE_CRITICAL(__VA_ARGS__); __debugbreak(); } }
#define GAME_ASSERT(cond, ...) { if (!(cond)) { GAME_CRITICAL(__VA_ARGS__); __debugbreak(); } }
#else
#define CORE_ASSERT(cond, ...) (cond)
#define GAME_ASSERT(cond, ...) (cond)
#endif
#pragma endregion

#define BIT(x) 1 << x
