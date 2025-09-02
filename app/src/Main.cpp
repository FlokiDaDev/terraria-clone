#include "PCH.h"

class TestLayer : public Engine::Layer
{
public:
	TestLayer()
		: Layer("Test")
	{
	}

	virtual void OnUpdate() override
	{
		GAME_DEBUG("TestLayer::OnUpdate()");
	}

	virtual void OnEvent(Engine::Event& event) override
	{
		GAME_DEBUG("{}", event);
	}
};

class Terraria : public Engine::Application
{
public:
	Terraria()
	{
		PushLayer(new TestLayer());
	}

	~Terraria()
	{

	}
};

Engine::Application* Engine::CreateApplication()
{
	return new Terraria();
}
