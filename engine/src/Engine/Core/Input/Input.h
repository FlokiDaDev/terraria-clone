#pragma once

namespace Engine
{
	class Input
	{
	public:
		static bool IsKeyPressed(int keycode) { return s_Instance->IsKeyPressedImpl(keycode); }

	protected:
		bool IsKeyPressedImpl(int keycode) { return false; }

	private:
		static Input* s_Instance;
	};
} // namespace Engine
