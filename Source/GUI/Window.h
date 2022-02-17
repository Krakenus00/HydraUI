#pragma once

#include "WinPrefs.h"
#include "Exception.h"

#include <optional>

namespace HydraGUI
{
    class Window
    {
	private:
        class Internal
        {
		public:
			static LPCWSTR GetName() noexcept;
			static HINSTANCE GetInstance() noexcept;
		private:
			Internal() noexcept;
			~Internal();
			Internal(const Internal&) = delete;
			Internal& operator=(const Internal&) = delete;
			static constexpr LPCWSTR wndClassName = L"BaseWindow";
			static Internal wndClass;
			HINSTANCE hInst;
        };
	public:
		Window(int width, int height, LPCWSTR name);
		~Window();
		Window(const Window&) = delete;
		Window& operator=(const Window&) = delete;
		static std::optional<int> ProcessMessages();
	private:
		// TODO:
		//static LRESULT CALLBACK HandleMsgSetup(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) noexcept;
		//static LRESULT CALLBACK HandleMsgThunk(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) noexcept;
		//LRESULT HandleMsg(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) noexcept;
	public:
		// TODO:
		//Keyboard kbd;
		//Mouse mouse;
	private:
		int width;
		int height;
		HWND hWnd;
    };
}
