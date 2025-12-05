local Library = {}
function Library:TweenInstance(Instance, Time, OldValue, NewValue)
	local rz_Tween = game:GetService("TweenService"):Create(Instance, TweenInfo.new(Time, Enum.EasingStyle.Quad),
		{ [OldValue] = NewValue })
	rz_Tween:Play()
	return rz_Tween
end

function Library:UpdateContent(Content, Title, Object)
	if Content.Text ~= "" then
		Title.Position = UDim2.new(0, 10, 0, 7)
		Title.Size = UDim2.new(1, -60, 0, 16)
		local MaxY = math.max(Content.TextBounds.Y + 15, 45)
		Object.Size = UDim2.new(1, 0, 0, MaxY)
	end
end

function Library:UpdateScrolling(Scroll, List)
	List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Scroll.CanvasSize = UDim2.new(0, 0, 0, List.AbsoluteContentSize.Y + 15)
	end)
end

function Library:MouseEvent(Skibidi, ...)
	local Args = { ... }
	Skibidi.MouseEnter:Connect(Args[1])
	Skibidi.MouseLeave:Connect(Args[2])
end

function Library:MakeConfig(Config, NewConfig)
	for i, v in next, Config do
		if not NewConfig[i] then
			NewConfig[i] = v
		end
	end
	return NewConfig
end

function Library:MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function UpdatePos(input)
		local Delta = input.Position - DragStart
		local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y)
		local Tween = game:GetService("TweenService"):Create(object, TweenInfo.new(0.2), { Position = pos })
		Tween:Play()
	end
	topbarobject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = input.Position
			StartPosition = object.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	topbarobject.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			DragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == DragInput and Dragging then
			UpdatePos(input)
		end
	end)
end

function Library:NewWindow(ConfigWindow)
	local ConfigWindow = self:MakeConfig({
		Title = "King Rua Hub",
		Description = "By _ng.shinichi",
	}, ConfigWindow or {})
	local KingRuaUI_Premium = Instance.new("ScreenGui")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Top = Instance.new("Frame")
	local Line = Instance.new("Frame")
	local Left = Instance.new("Folder")
	local NameHub = Instance.new("TextLabel")
	local LogoHub = Instance.new("ImageLabel")
	local Desc = Instance.new("TextLabel")
	local Right = Instance.new("Folder")
	local Frame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local Minize = Instance.new("TextButton")
	local Icon = Instance.new("ImageLabel")
	local Large = Instance.new("TextButton")
	local Icon_2 = Instance.new("ImageLabel")
	local Close = Instance.new("TextButton")
	local Icon_3 = Instance.new("ImageLabel")
	local UIStroke = Instance.new("UIStroke")
	local TabFrame = Instance.new("Frame")
	local Line_2 = Instance.new("Frame")
	local SearchFrame = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local IconSearch = Instance.new("ImageLabel")
	local SearchBox = Instance.new("TextBox")
	local ScrollingTab = Instance.new("ScrollingFrame")
	local UIPadding_2 = Instance.new("UIPadding")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local LayoutFrame = Instance.new("Frame")
	local RealLayout = Instance.new("Frame")
	local LayoutList = Instance.new("Folder")
	local UIPageLayout = Instance.new("UIPageLayout")
	local LayoutName = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local DropdownZone = Instance.new("Frame")
	KingRuaUI_Premium.Name = "KingRuaUI_Premium"
	KingRuaUI_Premium.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	KingRuaUI_Premium.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = KingRuaUI_Premium
	DropShadowHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadowHolder.Size = UDim2.new(0, 555, 0, 350)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Main.Name = "Main"
	Main.Parent = DropShadowHolder
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(9,9,9)
	Main.BackgroundTransparency = 0.070
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 555, 0, 350)

	UICorner.Parent = Main

	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Top.BackgroundTransparency = 1.000
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Size = UDim2.new(1, 0, 0, 50)

	Line.Name = "Line"
	Line.Parent = Top
	Line.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá
	Line.BackgroundTransparency = 0.500
	Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 1, -1)
	Line.Size = UDim2.new(1, 0, 0, 1)

	Left.Name = "Left"
	Left.Parent = Top

	NameHub.Name = "NameHub"
	NameHub.Parent = Left
	NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.BackgroundTransparency = 1.000
	NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NameHub.BorderSizePixel = 0
	NameHub.Position = UDim2.new(0, 60, 0, 10)
	NameHub.Size = UDim2.new(0, 470, 0, 20)
	NameHub.Font = Enum.Font.GothamBold
	NameHub.Text = ConfigWindow.Title
	NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.TextSize = 14.000
	NameHub.TextXAlignment = Enum.TextXAlignment.Left

	LogoHub.Name = "LogoHub"
	LogoHub.Parent = Left
	LogoHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogoHub.BackgroundTransparency = 1.000
	LogoHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoHub.BorderSizePixel = 0
	LogoHub.Position = UDim2.new(0, 10, 0, 5)
	LogoHub.Size = UDim2.new(0, 40, 0, 35)
	LogoHub.Image = "rbxassetid://124762714875426"

	Desc.Name = "Desc"
	Desc.Parent = Left
	Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Desc.BackgroundTransparency = 1.000
	Desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Desc.BorderSizePixel = 0
	Desc.Position = UDim2.new(0, 60, 0, 27)
	Desc.Size = UDim2.new(0, 470, 1, -30)
	Desc.Font = Enum.Font.GothamBold
	Desc.Text = ConfigWindow.Description
	Desc.TextColor3 = Color3.fromRGB(100, 100, 100)
	Desc.TextSize = 12.000
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	Desc.TextYAlignment = Enum.TextYAlignment.Top

	Right.Name = "Right"
	Right.Parent = Top

	Frame.Parent = Right
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(1, -110, 0, 0)
	Frame.Size = UDim2.new(0, 110, 1, 0)

	UIListLayout.Parent = Frame
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 6)

	UIPadding.Parent = Frame
	UIPadding.PaddingTop = UDim.new(0, 10)

	Minize.Name = "Minize"
	Minize.Parent = Frame
	Minize.Active = false
	Minize.AnchorPoint = Vector2.new(0, 0.5)
	Minize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minize.BackgroundTransparency = 1.000
	Minize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Minize.BorderSizePixel = 0
	Minize.Selectable = false
	Minize.Size = UDim2.new(0, 30, 0, 30)
	Minize.Text = ""

	Icon.Name = "Icon"
	Icon.Parent = Minize
	Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	Icon.Size = UDim2.new(0, 20, 0, 20)
	Icon.Image = "rbxassetid://136452605242985"
	Icon.ImageRectOffset = Vector2.new(288, 672)
	Icon.ImageRectSize = Vector2.new(96, 96)

	Large.Name = "Large"
	Large.Parent = Frame
	Large.Active = false
	Large.AnchorPoint = Vector2.new(0, 0.5)
	Large.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Large.BackgroundTransparency = 1.000
	Large.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Large.BorderSizePixel = 0
	Large.Selectable = false
	Large.Size = UDim2.new(0, 30, 0, 30)
	Large.Text = ""

	Icon_2.Name = "Icon"
	Icon_2.Parent = Large
	Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon_2.BackgroundTransparency = 1.000
	Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon_2.BorderSizePixel = 0
	Icon_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Icon_2.Size = UDim2.new(0, 18, 0, 18)
	Icon_2.Image = "rbxassetid://136452605242985"
	Icon_2.ImageRectOffset = Vector2.new(580, 194)
	Icon_2.ImageRectSize = Vector2.new(96, 96)

	Close.Name = "Close"
	Close.Parent = Frame
	Close.Active = false
	Close.AnchorPoint = Vector2.new(0, 0.5)
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Close.BorderSizePixel = 0
	Close.Selectable = false
	Close.Size = UDim2.new(0, 30, 0, 30)
	Close.Text = ""
	Close.MouseButton1Down:Connect(function()
		DropdownZone.Visible = true
		local tat_ = Instance.new("Frame", DropdownZone);
		tat_["BorderSizePixel"] = 0;
		tat_["BackgroundColor3"] = Color3.fromRGB(19, 19, 19);
		tat_["AnchorPoint"] = Vector2.new(0.5, 0.5);
		tat_["Size"] = UDim2.new(0, 400, 0, 150);
		tat_["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		tat_["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		tat_["Name"] = [[Tat]];


		-- Players.noguchihyuga.PlayerGui.KingRuaUI_Premium.DropShadowHolder.Main.DropdownZone.Tat.UIStroke
		local suacc = Instance.new("UIStroke", tat_);
		suacc["Transparency"] = 0.5;
		suacc["Color"] = Color3.fromRGB(101, 101, 101);


		-- Players.noguchihyuga.PlayerGui.KingRuaUI_Premium.DropShadowHolder.Main.DropdownZone.Tat.UICorner
		local suacc = Instance.new("UICorner", tat_);
		suacc["CornerRadius"] = UDim.new(0, 5);


		-- Players.noguchihyuga.PlayerGui.KingRuaUI_Premium.DropShadowHolder.Main.DropdownZone.Tat.TextLabel
		local suacc2 = Instance.new("TextLabel", tat_);
		suacc2["BorderSizePixel"] = 0;
		suacc2["TextSize"] = 20;
		suacc2["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		suacc2["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		suacc2["TextColor3"] = Color3.fromRGB(255, 255, 255);
		suacc2["BackgroundTransparency"] = 1;
		suacc2["Size"] = UDim2.new(0, 400, 0, 50);
		suacc2["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		suacc2["Text"] = [[Are you sure]];


		-- Players.noguchihyuga.PlayerGui.KingRuaUI_Premium.DropShadowHolder.Main.DropdownZone.Tat.TextButton
		local btnyes = Instance.new("TextButton", tat_);
		btnyes["BorderSizePixel"] = 0;
		btnyes["TextSize"] = 25;
		btnyes["TextColor3"] = Color3.fromRGB(255, 255, 255);
		btnyes["BackgroundColor3"] = Color3.fromRGB(5, 5, 5);
		btnyes["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		btnyes["AnchorPoint"] = Vector2.new(0, 1);
		btnyes["Size"] = UDim2.new(0, 150, 0, 50);
		btnyes["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		btnyes["Text"] = [[Yes]];
		btnyes["Position"] = UDim2.new(0, 40, 1, -40);
		btnyes.MouseButton1Down:Connect(function()
			KingRuaUI_Premium:Destroy()
		end)

		-- Players.noguchihyuga.PlayerGui.KingRuaUI_Premium.DropShadowHolder.Main.DropdownZone.Tat.TextButton.UICorner
		local thuaaa = Instance.new("UICorner", btnyes);



		-- Players.noguchihyuga.PlayerGui.KingRuaUI_Premium.DropShadowHolder.Main.DropdownZone.Tat.TextButton.UIStroke
		local thuaaa = Instance.new("UIStroke", btnyes);
		thuaaa["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		thuaaa["Color"] = Color3.fromRGB(39, 39, 39);


		-- Players.noguchihyuga.PlayerGui.KingRuaUI_Premium.DropShadowHolder.Main.DropdownZone.Tat.TextButton
		local btnno = Instance.new("TextButton", tat_);
		btnno["BorderSizePixel"] = 0;
		btnno["TextSize"] = 25;
		btnno["TextColor3"] = Color3.fromRGB(255, 255, 255);
		btnno["BackgroundColor3"] = Color3.fromRGB(5, 5, 5);
		btnno["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		btnno["AnchorPoint"] = Vector2.new(1, 1);
		btnno["Size"] = UDim2.new(0, 150, 0, 50);
		btnno["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		btnno["Text"] = [[No]];
		btnno["Position"] = UDim2.new(1, -40, 1, -40);
		btnno.MouseButton1Down:Connect(function()
			DropdownZone.Visible = false
			tat_:Destroy()
		end)

		-- Players.noguchihyuga.PlayerGui.KingRuaUI_Premium.DropShadowHolder.Main.DropdownZone.Tat.TextButton.UICorner
		local thuaaa = Instance.new("UICorner", btnno);



		-- Players.noguchihyuga.PlayerGui.KingRuaUI_Premium.DropShadowHolder.Main.DropdownZone.Tat.TextButton.UIStroke
		local thuaaa = Instance.new("UIStroke", btnno);
		thuaaa["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		thuaaa["Color"] = Color3.fromRGB(39, 39, 39);
	end)

	Icon_3.Name = "Icon"
	Icon_3.Parent = Close
	Icon_3.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon_3.BackgroundTransparency = 1.000
	Icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon_3.BorderSizePixel = 0
	Icon_3.Position = UDim2.new(0.5, 0, 0.5, 0)
	Icon_3.Size = UDim2.new(0, 18, 0, 18)
	Icon_3.Image = "rbxassetid://136452605242985"
	Icon_3.ImageRectOffset = Vector2.new(384, 96)
	Icon_3.ImageRectSize = Vector2.new(96, 96)

	UIStroke.Parent = Main
	UIStroke.Color = Color3.fromRGB(0, 200, 0) -- Màu xanh lá
	UIStroke.Thickness = 1
	UIStroke.Transparency = 0.500

	TabFrame.Name = "TabFrame"
	TabFrame.Parent = Main
	TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabFrame.BackgroundTransparency = 1.000
	TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabFrame.BorderSizePixel = 0
	TabFrame.Position = UDim2.new(0, 10, 0, 50)
	TabFrame.Size = UDim2.new(0, 150, 1, -60)

	Line_2.Name = "Line"
	Line_2.Parent = TabFrame
	Line_2.AnchorPoint = Vector2.new(1, 0)
	Line_2.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá
	Line_2.BackgroundTransparency = 0.500
	Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line_2.BorderSizePixel = 0
	Line_2.Position = UDim2.new(1, -1, 0, 0)
	Line_2.Size = UDim2.new(0, 1, 1, 0)

	SearchFrame.Name = "SearchFrame"
	SearchFrame.Parent = TabFrame
	SearchFrame.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
	SearchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchFrame.BorderSizePixel = 0
	SearchFrame.Size = UDim2.new(1, 0, 0, 30)

	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = SearchFrame

	IconSearch.Name = "IconSearch"
	IconSearch.Parent = SearchFrame
	IconSearch.AnchorPoint = Vector2.new(0, 0.5)
	IconSearch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	IconSearch.BackgroundTransparency = 1.000
	IconSearch.BorderColor3 = Color3.fromRGB(0, 0, 0)
	IconSearch.BorderSizePixel = 0
	IconSearch.Position = UDim2.new(0, 10, 0.5, 0)
	IconSearch.Size = UDim2.new(0, 15, 0, 15)
	IconSearch.Image = "rbxassetid://71309835376233"

	SearchBox.Name = "SearchBox"
	SearchBox.Parent = SearchFrame
	SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchBox.BackgroundTransparency = 1.000
	SearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchBox.BorderSizePixel = 0
	SearchBox.ClipsDescendants = true
	SearchBox.Position = UDim2.new(0, 35, 0, 0)
	SearchBox.Size = UDim2.new(1, -35, 1, 0)
	SearchBox.Font = Enum.Font.GothamBold
	SearchBox.PlaceholderText = "Search..."
	SearchBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
	SearchBox.Text = ""
	SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	SearchBox.TextSize = 12.000
	SearchBox.TextXAlignment = Enum.TextXAlignment.Left

	ScrollingTab.Name = "ScrollingTab"
	ScrollingTab.Parent = TabFrame
	ScrollingTab.Active = true
	ScrollingTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingTab.BackgroundTransparency = 1.000
	ScrollingTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingTab.BorderSizePixel = 0
	ScrollingTab.Position = UDim2.new(0, 0, 0, 40)
	ScrollingTab.Size = UDim2.new(1, 0, 1, -40)
	ScrollingTab.VerticalScrollBarInset = Enum.ScrollBarInset.Always
	ScrollingTab.CanvasSize = UDim2.new(0, 0, 0, 0)

	UIPadding_2.Parent = ScrollingTab
	UIPadding_2.PaddingBottom = UDim.new(0, 5)

	UIListLayout_2.Parent = ScrollingTab
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Padding = UDim.new(0, 5)

	LayoutFrame.Name = "LayoutFrame"
	LayoutFrame.Parent = Main
	LayoutFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LayoutFrame.BackgroundTransparency = 1.000
	LayoutFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LayoutFrame.BorderSizePixel = 0
	LayoutFrame.Position = UDim2.new(0, 170, 0, 60)
	LayoutFrame.Size = UDim2.new(1, -180, 1, -70)

	RealLayout.Name = "RealLayout"
	RealLayout.Parent = LayoutFrame
	RealLayout.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RealLayout.BackgroundTransparency = 1.000
	RealLayout.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RealLayout.BorderSizePixel = 0
	RealLayout.Size = UDim2.new(1, 0, 1, 0)

	LayoutList.Name = "LayoutList"
	LayoutList.Parent = RealLayout

	UIPageLayout.Parent = LayoutList
	UIPageLayout.FillDirection = Enum.FillDirection.Horizontal
	UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIPageLayout.EasingStyle = Enum.EasingStyle.Quart
	UIPageLayout.EasingDirection = Enum.EasingDirection.Out
	UIPageLayout.TweenTime = 0.300

	LayoutName.Name = "LayoutName"
	LayoutName.Parent = LayoutFrame
	LayoutName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LayoutName.BackgroundTransparency = 1.000
	LayoutName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LayoutName.BorderSizePixel = 0
	LayoutName.Size = UDim2.new(1, 0, 0, 20)

	TextLabel.Parent = LayoutName
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.Text = "No Tab Added"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000

	DropdownZone.Name = "DropdownZone"
	DropdownZone.Parent = Main
	DropdownZone.AnchorPoint = Vector2.new(0.5, 0.5)
	DropdownZone.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	DropdownZone.BackgroundTransparency = 0.900
	DropdownZone.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DropdownZone.BorderSizePixel = 0
	DropdownZone.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropdownZone.Size = UDim2.new(1, 0, 1, 0)
	DropdownZone.Visible = false
	self:MakeDraggable(Top, DropShadowHolder)
	local AllLayouts = 0
	local Tab = {}
	function Tab:T(t)
		local TabDisable = Instance.new("Frame")
		local Choose_2 = Instance.new("Frame")
		local UICorner_4 = Instance.new("UICorner")
		local NameTab_2 = Instance.new("TextLabel")
		local Click_Tab_2 = Instance.new("TextButton")
		local Layout = Instance.new("ScrollingFrame")
		local UIPadding_3 = Instance.new("UIPadding")
		local UIListLayout_3 = Instance.new("UIListLayout")
		TabDisable.Name = "TabDisable"
		TabDisable.Parent = ScrollingTab
		TabDisable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabDisable.BackgroundTransparency = 1.000
		TabDisable.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabDisable.BorderSizePixel = 0
		TabDisable.Size = UDim2.new(1, 0, 0, 25)
		Choose_2.Name = "Choose"
		Choose_2.Parent = TabDisable
		Choose_2.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 179, 0, 255)
		Choose_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Choose_2.BorderSizePixel = 0
		Choose_2.Size = UDim2.new(0, 3, 1, 0)
		UICorner_4.CornerRadius = UDim.new(0, 3)
		UICorner_4.Parent = Choose_2
		NameTab_2.Name = "NameTab"
		NameTab_2.Parent = TabDisable
		NameTab_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NameTab_2.BackgroundTransparency = 1.000
		NameTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NameTab_2.BorderSizePixel = 0
		NameTab_2.Position = UDim2.new(0, 10, 0, 0)
		NameTab_2.Size = UDim2.new(1, -10, 1, 0)
		NameTab_2.Font = Enum.Font.GothamBold
		NameTab_2.Text = t
		NameTab_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		NameTab_2.TextSize = 13.000
		NameTab_2.TextXAlignment = Enum.TextXAlignment.Left
		Click_Tab_2.Name = "Click_Tab"
		Click_Tab_2.Parent = TabDisable
		Click_Tab_2.Active = false
		Click_Tab_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Click_Tab_2.BackgroundTransparency = 1.000
		Click_Tab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Click_Tab_2.BorderSizePixel = 0
		Click_Tab_2.Selectable = false
		Click_Tab_2.Size = UDim2.new(1, 0, 1, 0)
		Click_Tab_2.Text = ""
		Layout.Name = "Layout"
		Layout.Parent = LayoutList
		Layout.Active = true
		Layout.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		Layout.BackgroundTransparency = 0.500
		Layout.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Layout.BorderSizePixel = 0
		Layout.Size = UDim2.new(1, 0, 1, 0)
		Layout.VerticalScrollBarInset = Enum.ScrollBarInset.Always
		Layout.CanvasSize = UDim2.new(0, 0, 0, 0)
		UIPadding_3.Parent = Layout
		UIPadding_3.PaddingBottom = UDim.new(0, 5)
		UIPadding_3.PaddingLeft = UDim.new(0, 10)
		UIPadding_3.PaddingRight = UDim.new(0, 10)
		UIPadding_3.PaddingTop = UDim.new(0, 5)
		UIListLayout_3.Parent = Layout
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_3.Padding = UDim.new(0, 7)
		AllLayouts = AllLayouts + 1
		local TabFunc = {}
		local LayoutNumber = AllLayouts
		Click_Tab_2.MouseButton1Down:Connect(function()
			UIPageLayout:JumpTo(Layout)
			TextLabel.Text = t
			for i, v in next, ScrollingTab:GetChildren() do
				if v:IsA("Frame") then
					Library:TweenInstance(v.Choose, 0.2, "Size", UDim2.new(0, 3, 1, 0))
				end
			end
			Library:TweenInstance(Choose_2, 0.2, "Size", UDim2.new(1, 0, 1, 0))
		end)
		if AllLayouts == 1 then
			UIPageLayout:JumpTo(Layout)
			TextLabel.Text = t
			Library:TweenInstance(Choose_2, 0.2, "Size", UDim2.new(1, 0, 1, 0))
		end
		function TabFunc:AddSection(cfsection)
			local cfsection = Library:MakeConfig({
				Title = "Section",
			}, cfsection or {})
			local SectionFunc = {}
			local Section = Instance.new("Frame")
			local UICorner_5 = Instance.new("UICorner")
			local UIStroke_2 = Instance.new("UIStroke")
			local NameSection = Instance.new("Frame")
			local Title = Instance.new("TextLabel")
			local Line_3 = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local SectionList = Instance.new("Frame")
			local UIPadding_4 = Instance.new("UIPadding")
			local UIListLayout_4 = Instance.new("UIListLayout")
			Section.Name = "Section"
			Section.Parent = Layout
			Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Section.BackgroundTransparency = 0.980
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			Section.Size = UDim2.new(1, 0, 0, 55)
			UICorner_5.CornerRadius = UDim.new(0, 4)
			UICorner_5.Parent = Section
			UIStroke_2.Color = Color3.fromRGB(100, 100, 100)
			UIStroke_2.Thickness = 2
			UIStroke_2.Transparency = 0.9200000166893005
			UIStroke_2.Parent = Section
			NameSection.Name = "NameSection"
			NameSection.Parent = Section
			NameSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NameSection.BackgroundTransparency = 1.000
			NameSection.BorderColor3 = Color3.fromRGB(0, 0, 0)
			NameSection.BorderSizePixel = 0
			NameSection.Size = UDim2.new(1, 0, 0, 30)
			Title.Name = "Title"
			Title.Parent = NameSection
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0, 10, 0, 0)
			Title.Size = UDim2.new(1, -10, 1, 0)
			Title.Font = Enum.Font.GothamBold
			Title.Text = cfsection.Title
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 14.000
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Line_3.Name = "Line"
			Line_3.Parent = NameSection
			Line_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Line_3.BackgroundTransparency = 1.000
			Line_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line_3.BorderSizePixel = 0
			Line_3.Position = UDim2.new(0, 10, 1, -1)
			Line_3.Size = UDim2.new(0, 100, 0, 1)
			UIGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 200, 0)), -- Màu xanh lá (trước đây là 179, 0, 255)
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 200, 0)) -- Màu xanh lá (trước đây là 179, 0, 255)
			})
			UIGradient.Rotation = 90
			UIGradient.Parent = Line_3
			SectionList.Name = "SectionList"
			SectionList.Parent = Section
			SectionList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionList.BackgroundTransparency = 1.000
			SectionList.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionList.BorderSizePixel = 0
			SectionList.Position = UDim2.new(0, 0, 0, 35)
			SectionList.Size = UDim2.new(1, 0, 0, 0)
			UIPadding_4.Parent = SectionList
			UIPadding_4.PaddingBottom = UDim.new(0, 7)
			UIPadding_4.PaddingTop = UDim.new(0, 7)
			UIListLayout_4.Parent = SectionList
			UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_4.Padding = UDim.new(0, 7)
			Section.Size = UDim2.new(1, 0, 0, NameSection.Size.Offset + SectionList.Size.Offset + 15)
			SectionList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				local ListSizeY = UIListLayout_4.AbsoluteContentSize.Y
				local PaddingY = UIPadding_4.PaddingBottom.Offset + UIPadding_4.PaddingTop.Offset
				Section.Size = UDim2.new(1, 0, 0, NameSection.Size.Offset + ListSizeY + PaddingY + 15)
			end)
			function SectionFunc:AddToggle(cftoggle)
				local cftoggle = Library:MakeConfig({
					Title = "Toggle < Missing Title >",
					Description = "",
					Default = false,
					Callback = function() end
				}, cftoggle or {})
				local ToggleFunc = {}
				local Toggle = Instance.new("Frame")
				local UICorner_6 = Instance.new("UICorner")
				local Title_2 = Instance.new("TextLabel")
				local ToggleCheck = Instance.new("TextButton")
				local Check = Instance.new("ImageLabel")
				local UIStroke_3 = Instance.new("UIStroke")
				local Content_3 = Instance.new("TextLabel")
				local UIPadding_5 = Instance.new("UIPadding")
				Toggle.Name = "Toggle"
				Toggle.Parent = SectionList
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 0.950
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.Size = UDim2.new(1, 0, 0, 35)
				UICorner_6.CornerRadius = UDim.new(0, 3)
				UICorner_6.Parent = Toggle
				Title_2.Name = "Title"
				Title_2.Parent = Toggle
				Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_2.BackgroundTransparency = 1.000
				Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_2.BorderSizePixel = 0
				Title_2.Position = UDim2.new(0, 10, 0, 0)
				Title_2.Size = UDim2.new(1, -60, 1, 0)
				Title_2.Font = Enum.Font.GothamBold
				Title_2.Text = cftoggle.Title
				Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title_2.TextSize = 13.000
				Title_2.TextXAlignment = Enum.TextXAlignment.Left
				ToggleCheck.Name = "ToggleCheck"
				ToggleCheck.Parent = Toggle
				ToggleCheck.AnchorPoint = Vector2.new(1, 0.5)
				ToggleCheck.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				ToggleCheck.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ToggleCheck.BorderSizePixel = 0
				ToggleCheck.Position = UDim2.new(1, -10, 0.5, 0)
				ToggleCheck.Size = UDim2.new(0, 35, 0, 15)
				ToggleCheck.Text = ""
				Check.Name = "Check"
				Check.Parent = ToggleCheck
				Check.AnchorPoint = Vector2.new(0, 0.5)
				Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Check.BackgroundTransparency = 1.000
				Check.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Check.BorderSizePixel = 0
				Check.Position = UDim2.new(0, 1, 0.5, 0)
				Check.Size = UDim2.new(0, 13, 0, 13)
				Check.Image = "rbxassetid://136452605242985"
				Check.ImageColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá
				Check.ImageRectOffset = Vector2.new(384, 96)
				Check.ImageRectSize = Vector2.new(96, 96)
				UIStroke_3.Color = Color3.fromRGB(100, 100, 100)
				UIStroke_3.Thickness = 2
				UIStroke_3.Transparency = 0.950
				UIStroke_3.Parent = ToggleCheck
				Content_3.Name = "Content"
				Content_3.Parent = Toggle
				Content_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content_3.BackgroundTransparency = 1.000
				Content_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content_3.BorderSizePixel = 0
				Content_3.Position = UDim2.new(0, 10, 0, 20)
				Content_3.Size = UDim2.new(1, -60, 0, 0)
				Content_3.Font = Enum.Font.GothamBold
				Content_3.Text = cftoggle.Description
				Content_3.TextColor3 = Color3.fromRGB(100, 100, 100)
				Content_3.TextSize = 12.000
				Content_3.TextXAlignment = Enum.TextXAlignment.Left
				Content_3.TextYAlignment = Enum.TextYAlignment.Top
				UIPadding_5.Parent = Toggle
				UIPadding_5.PaddingBottom = UDim.new(0, 7)
				UIPadding_5.PaddingTop = UDim.new(0, 7)
				Library:UpdateContent(Content_3, Title_2, Toggle)
				local IsActive = cftoggle.Default
				ToggleFunc.Value = IsActive
				function ToggleFunc:Set(args)
					IsActive = args
					ToggleFunc.Value = IsActive
					if IsActive then
						Library:TweenInstance(ToggleCheck, 0.2, "BackgroundColor3", Color3.fromRGB(0, 200, 0)) -- Màu xanh lá (trước đây là 179, 0, 255)
						Library:TweenInstance(Check, 0.2, "Position", UDim2.new(1, -14, 0.5, 0))
						Check.ImageTransparency = 0.000
					else
						Library:TweenInstance(ToggleCheck, 0.2, "BackgroundColor3", Color3.fromRGB(15, 15, 15))
						Library:TweenInstance(Check, 0.2, "Position", UDim2.new(0, 1, 0.5, 0))
						Check.ImageTransparency = 1.000
					end
				end
				ToggleFunc:Set(cftoggle.Default)
				ToggleCheck.MouseButton1Down:Connect(function()
					if IsActive then
						ToggleFunc:Set(false)
					else
						ToggleFunc:Set(true)
					end
					cftoggle.Callback(IsActive)
				end)
				return ToggleFunc
			end
			function SectionFunc:AddButton(cfbutton)
				local cfbutton = Library:MakeConfig({
					Title = "Button < Missing Title >",
					Description = "",
					Callback = function() end
				}, cfbutton or {})
				local Button = Instance.new("Frame")
				local UICorner_9 = Instance.new("UICorner")
				local Title_3 = Instance.new("TextLabel")
				local Button_Click = Instance.new("TextButton")
				local Content_2 = Instance.new("TextLabel")
				local ImageLabel = Instance.new("ImageLabel")
				Button.Name = "Button"
				Button.Parent = SectionList
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 0.950
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(1, 0, 0, 35)
				UICorner_9.CornerRadius = UDim.new(0, 3)
				UICorner_9.Parent = Button
				Title_3.Name = "Title"
				Title_3.Parent = Button
				Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_3.BackgroundTransparency = 1.000
				Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_3.BorderSizePixel = 0
				Title_3.Position = UDim2.new(0, 10, 0, 0)
				Title_3.Size = UDim2.new(1, -60, 1, 0)
				Title_3.Font = Enum.Font.GothamBold
				Title_3.Text = cfbutton.Title
				Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title_3.TextSize = 13.000
				Title_3.TextXAlignment = Enum.TextXAlignment.Left
				Button_Click.Name = "Button_Click"
				Button_Click.Parent = Button
				Button_Click.AnchorPoint = Vector2.new(1, 0.5)
				Button_Click.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 179, 0, 255)
				Button_Click.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button_Click.BorderSizePixel = 0
				Button_Click.Position = UDim2.new(1, -10, 0.5, 0)
				Button_Click.Size = UDim2.new(0, 35, 0, 15)
				Button_Click.Text = ""
				Button_Click.MouseButton1Down:Connect(cfbutton.Callback)
				Content_2.Name = "Content"
				Content_2.Parent = Button
				Content_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content_2.BackgroundTransparency = 1.000
				Content_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content_2.BorderSizePixel = 0
				Content_2.Position = UDim2.new(0, 10, 0, 20)
				Content_2.Size = UDim2.new(1, -60, 0, 0)
				Content_2.Font = Enum.Font.GothamBold
				Content_2.Text = cfbutton.Description
				Content_2.TextColor3 = Color3.fromRGB(100, 100, 100)
				Content_2.TextSize = 12.000
				Content_2.TextXAlignment = Enum.TextXAlignment.Left
				Content_2.TextYAlignment = Enum.TextYAlignment.Top
				ImageLabel.Parent = Button_Click
				ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
				ImageLabel.Size = UDim2.new(0, 13, 0, 13)
				ImageLabel.Image = "rbxassetid://136452605242985"
				ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.ImageRectOffset = Vector2.new(480, 576)
				ImageLabel.ImageRectSize = Vector2.new(96, 96)
				Library:UpdateContent(Content_2, Title_3, Button)
			end
			function SectionFunc:AddDropdown(cfdropdown)
				local cfdropdown = Library:MakeConfig({
					Title = "Dropdown < Missing Title >",
					Description = "",
					Values = { "Value" },
					Default = "Value",
					Callback = function() end
				}, cfdropdown or {})
				local DropFunc = {}
				local Dropdown = Instance.new("Frame")
				local UICorner_19 = Instance.new("UICorner")
				local Title_8 = Instance.new("TextLabel")
				local ValueName = Instance.new("TextLabel")
				local Click_Dropdown = Instance.new("TextButton")
				local Icon_4 = Instance.new("ImageLabel")
				local Real_List = Instance.new("ScrollingFrame")
				local UICorner_26 = Instance.new("UICorner")
				local UIListLayout_5 = Instance.new("UIListLayout")
				local UIPadding_5 = Instance.new("UIPadding")
				local DropdownList = Instance.new("Frame")
				local UIStroke_3 = Instance.new("UIStroke")
				local UICorner_24 = Instance.new("UICorner")
				local Topbar = Instance.new("Frame")
				local Title_10 = Instance.new("TextLabel")
				local Close_2 = Instance.new("TextButton")
				local Icon_6 = Instance.new("ImageLabel")
				local Button_Click_2 = Instance.new("TextButton")
				local Content_6 = Instance.new("TextLabel")
				Dropdown.Name = "Dropdown"
				Dropdown.Parent = SectionList
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 0.950
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.Size = UDim2.new(1, 0, 0, 35)
				UICorner_19.CornerRadius = UDim.new(0, 3)
				UICorner_19.Parent = Dropdown
				Title_8.Name = "Title"
				Title_8.Parent = Dropdown
				Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_8.BackgroundTransparency = 1.000
				Title_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_8.BorderSizePixel = 0
				Title_8.Position = UDim2.new(0, 10, 0, 0)
				Title_8.Size = UDim2.new(1, -60, 1, 0)
				Title_8.Font = Enum.Font.GothamBold
				Title_8.Text = cfdropdown.Title
				Title_8.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title_8.TextSize = 13.000
				Title_8.TextXAlignment = Enum.TextXAlignment.Left
				ValueName.Name = "ValueName"
				ValueName.Parent = Dropdown
				ValueName.AnchorPoint = Vector2.new(1, 0.5)
				ValueName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueName.BackgroundTransparency = 1.000
				ValueName.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueName.BorderSizePixel = 0
				ValueName.Position = UDim2.new(1, -50, 0.5, 0)
				ValueName.Size = UDim2.new(0, 100, 0, 35)
				ValueName.Font = Enum.Font.GothamBold
				ValueName.Text = "Default"
				ValueName.TextColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 179, 0, 255)
				ValueName.TextSize = 13.000
				ValueName.TextXAlignment = Enum.TextXAlignment.Right
				Click_Dropdown.Name = "Click_Dropdown"
				Click_Dropdown.Parent = Dropdown
				Click_Dropdown.Active = false
				Click_Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Click_Dropdown.BackgroundTransparency = 1.000
				Click_Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Click_Dropdown.BorderSizePixel = 0
				Click_Dropdown.Selectable = false
				Click_Dropdown.Size = UDim2.new(1, 0, 1, 0)
				Click_Dropdown.Text = ""
				Icon_4.Name = "Icon"
				Icon_4.Parent = Click_Dropdown
				Icon_4.AnchorPoint = Vector2.new(1, 0.5)
				Icon_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon_4.BackgroundTransparency = 1.000
				Icon_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon_4.BorderSizePixel = 0
				Icon_4.Position = UDim2.new(1, -10, 0.5, 0)
				Icon_4.Size = UDim2.new(0, 13, 0, 13)
				Icon_4.Image = "rbxassetid://136452605242985"
				Icon_4.ImageRectOffset = Vector2.new(288, 384)
				Icon_4.ImageRectSize = Vector2.new(96, 96)
				DropdownList.Name = "DropdownList"
				DropdownList.Parent = DropdownZone
				DropdownList.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownList.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
				DropdownList.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DropdownList.BorderSizePixel = 0
				DropdownList.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropdownList.Size = UDim2.new(0, 400, 0, 250)
				DropdownList.Visible = false
				UIStroke_3.Color = Color3.fromRGB(100, 100, 100)
				UIStroke_3.Transparency = 0.5
				UIStroke_3.Parent = DropdownList
				UICorner_24.CornerRadius = UDim.new(0, 5)
				UICorner_24.Parent = DropdownList
				Topbar.Name = "Topbar"
				Topbar.Parent = DropdownList
				Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Topbar.BackgroundTransparency = 1.000
				Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Topbar.BorderSizePixel = 0
				Topbar.Size = UDim2.new(1, 0, 0, 50)
				Title_10.Name = "Title"
				Title_10.Parent = Topbar
				Title_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_10.BackgroundTransparency = 1.000
				Title_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_10.BorderSizePixel = 0
				Title_10.Position = UDim2.new(0, 10, 0, 0)
				Title_10.Size = UDim2.new(1, -60, 1, 0)
				Title_10.Font = Enum.Font.GothamBold
				Title_10.Text = cfdropdown.Title
				Title_10.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title_10.TextSize = 14.000
				Title_10.TextXAlignment = Enum.TextXAlignment.Left
				Close_2.Name = "Close"
				Close_2.Parent = Topbar
				Close_2.Active = false
				Close_2.AnchorPoint = Vector2.new(1, 0.5)
				Close_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Close_2.BackgroundTransparency = 1.000
				Close_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Close_2.BorderSizePixel = 0
				Close_2.Position = UDim2.new(1, -10, 0.5, 0)
				Close_2.Selectable = false
				Close_2.Size = UDim2.new(0, 30, 0, 30)
				Close_2.Text = ""
				Close_2.MouseButton1Down:Connect(function()
					DropdownList.Visible = false
					DropdownZone.Visible = false
				end)
				Icon_6.Name = "Icon"
				Icon_6.Parent = Close_2
				Icon_6.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon_6.BackgroundTransparency = 1.000
				Icon_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon_6.BorderSizePixel = 0
				Icon_6.Position = UDim2.new(0.5, 0, 0.5, 0)
				Icon_6.Size = UDim2.new(0, 18, 0, 18)
				Icon_6.Image = "rbxassetid://136452605242985"
				Icon_6.ImageRectOffset = Vector2.new(384, 96)
				Icon_6.ImageRectSize = Vector2.new(96, 96)
				Real_List.Name = "Real_List"
				Real_List.Parent = DropdownList
				Real_List.Active = true
				Real_List.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
				Real_List.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Real_List.BorderSizePixel = 0
				Real_List.Position = UDim2.new(0, 10, 0, 50)
				Real_List.Selectable = false
				Real_List.ScrollBarThickness = 0
				Real_List.Size = UDim2.new(1, -20, 1, -60)
				Library:UpdateScrolling(Real_List, UIListLayout_5)
				UICorner_26.CornerRadius = UDim.new(0, 5)
				UICorner_26.Parent = Real_List
				UIListLayout_5.Parent = Real_List
				UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_5.Padding = UDim.new(0, 5)
				UIPadding_5.Parent = Real_List
				UIPadding_5.PaddingBottom = UDim.new(0, 7)
				UIPadding_5.PaddingLeft = UDim.new(0, 7)
				UIPadding_5.PaddingRight = UDim.new(0, 7)
				UIPadding_5.PaddingTop = UDim.new(0, 7)
				local UICorner_29 = Instance.new("UICorner")
				UICorner_29.Parent = DropdownZone
				Drop_Click.Activated:Connect(function()
					DropdownZone.Visible = true
					DropdownList.Visible = true
					Library:TweenInstance(Icon_4, 0.2, "Rotation", 180)
				end)
				Close_2.MouseButton1Down:Connect(function()
					Library:TweenInstance(Icon_4, 0.2, "Rotation", 0)
				end)
				function DropFunc:Set(args)
					DropFunc.Value = args
					if typeof(args) == "table" and #args > 0 then
						ValueName.Text = #args .. " Selected"
					elseif typeof(args) == "string" then
						ValueName.Text = args
					else
						ValueName.Text = cfdropdown.Default
					end
					for i, v in next, Real_List:GetChildren() do
						if v:IsA("Frame") then
							local Title_12 = v.Title
							local ToggleCheck_2 = v.ToggleCheck
							local IsExist = false
							if typeof(DropFunc.Value) == "table" then
								for _, v in next, DropFunc.Value do
									if v == Title_12.Text then
										IsExist = true
										break
									end
								end
							elseif typeof(DropFunc.Value) == "string" then
								if DropFunc.Value == Title_12.Text then
									IsExist = true
								end
							end
							if IsExist then
								Library:TweenInstance(ToggleCheck_2, 0.2, "BackgroundColor3", Color3.fromRGB(0, 200, 0)) -- Màu xanh lá (trước đây là 179, 0, 255)
							else
								Library:TweenInstance(ToggleCheck_2, 0.2, "BackgroundColor3", Color3.fromRGB(15, 15, 15))
							end
						end
					end
					cfdropdown.Callback(args)
				end
				function DropFunc:Add(args)
					local Frame = Instance.new("Frame")
					local UICorner_25 = Instance.new("UICorner")
					local Title_12 = Instance.new("TextLabel")
					local ToggleCheck_2 = Instance.new("TextButton")
					local Check_2 = Instance.new("ImageLabel")
					local UIStroke_4 = Instance.new("UIStroke")
					Frame.Name = "Frame"
					Frame.Parent = Real_List
					Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
					Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Frame.BorderSizePixel = 0
					Frame.Size = UDim2.new(1, 0, 0, 35)
					UICorner_25.CornerRadius = UDim.new(0, 3)
					UICorner_25.Parent = Frame
					Title_12.Name = "Title"
					Title_12.Parent = Frame
					Title_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title_12.BackgroundTransparency = 1.000
					Title_12.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Title_12.BorderSizePixel = 0
					Title_12.Position = UDim2.new(0, 10, 0, 0)
					Title_12.Size = UDim2.new(1, -60, 1, 0)
					Title_12.Font = Enum.Font.GothamBold
					Title_12.Text = args
					Title_12.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title_12.TextSize = 13.000
					Title_12.TextXAlignment = Enum.TextXAlignment.Left
					ToggleCheck_2.Name = "ToggleCheck"
					ToggleCheck_2.Parent = Frame
					ToggleCheck_2.AnchorPoint = Vector2.new(1, 0.5)
					ToggleCheck_2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
					ToggleCheck_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ToggleCheck_2.BorderSizePixel = 0
					ToggleCheck_2.Position = UDim2.new(1, -10, 0.5, 0)
					ToggleCheck_2.Size = UDim2.new(0, 35, 0, 15)
					ToggleCheck_2.Text = ""
					Check_2.Name = "Check"
					Check_2.Parent = ToggleCheck_2
					Check_2.AnchorPoint = Vector2.new(0.5, 0.5)
					Check_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Check_2.BackgroundTransparency = 1.000
					Check_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Check_2.BorderSizePixel = 0
					Check_2.Position = UDim2.new(0.5, 0, 0.5, 0)
					Check_2.Size = UDim2.new(0, 13, 0, 13)
					Check_2.Image = "rbxassetid://136452605242985"
					Check_2.ImageColor3 = Color3.fromRGB(255, 255, 255)
					Check_2.ImageRectOffset = Vector2.new(480, 576)
					Check_2.ImageRectSize = Vector2.new(96, 96)
					UIStroke_4.Color = Color3.fromRGB(100, 100, 100)
					UIStroke_4.Thickness = 2
					UIStroke_4.Transparency = 0.950
					UIStroke_4.Parent = ToggleCheck_2
					ToggleCheck_2.MouseButton1Down:Connect(function()
						if typeof(DropFunc.Value) == "string" then
							if DropFunc.Value == Title_12.Text then
								DropFunc:Set(cfdropdown.Default)
							else
								DropFunc:Set(Title_12.Text)
							end
						elseif typeof(DropFunc.Value) == "table" then
							local IsExist = false
							for i, v in next, DropFunc.Value do
								if v == Title_12.Text then
									IsExist = true
									table.remove(DropFunc.Value, i)
									break
								end
							end
							if not IsExist then
								table.insert(DropFunc.Value, Title_12.Text)
							end
							DropFunc:Set(DropFunc.Value)
						end
					end)
				end
				function DropFunc:Clear()
					for i, v in next, Real_List:GetChildren() do
						if v:IsA("Frame") then
							v:Destroy()
						end
					end
				end
				function DropFunc:Refresh(NewList)
					self:Clear()
					for i, v in next, NewList do
						self:Add(v)
					end
				end
				DropFunc:Refresh(cfdropdown.Values)
				DropFunc:Set(typeof(cfdropdown.Default) == "string" and { cfdropdown.Default } or cfdropdown.Default)
				return DropFunc
			end
			function SectionFunc:AddInput(cftextbox)
				local cftextbox = Library:MakeConfig({
					Title = "Textbox",
					Description = "",
					PlaceHolder = "",
					Default = "",
					Callback = function() end
				}, cftextbox or {})
				local Input = Instance.new("Frame")
				local UICorner_17 = Instance.new("UICorner")
				local Title_7 = Instance.new("TextLabel")
				local Content_5 = Instance.new("TextLabel")
				local TextboxFrame = Instance.new("Frame")
				local UICorner_18 = Instance.new("UICorner")
				local RealTextBox = Instance.new("TextBox")
				local WritingIcon = Instance.new("ImageLabel")
				Input.Name = "Input"
				Input.Parent = SectionList
				Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Input.BackgroundTransparency = 0.950
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.Size = UDim2.new(1, 0, 0, 60)
				UICorner_17.CornerRadius = UDim.new(0, 3)
				UICorner_17.Parent = Input
				Title_7.Name = "Title"
				Title_7.Parent = Input
				Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_7.BackgroundTransparency = 1.000
				Title_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_7.BorderSizePixel = 0
				Title_7.Position = UDim2.new(0, 10, 0, 0)
				Title_7.Size = UDim2.new(1, -60, 0, 18)
				Title_7.Font = Enum.Font.GothamBold
				Title_7.Text = cftextbox.Title
				Title_7.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title_7.TextSize = 13.000
				Title_7.TextXAlignment = Enum.TextXAlignment.Left
				Content_5.Name = "Content"
				Content_5.Parent = Input
				Content_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content_5.BackgroundTransparency = 1.000
				Content_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content_5.BorderSizePixel = 0
				Content_5.Position = UDim2.new(0, 10, 0, 20)
				Content_5.Size = UDim2.new(1, -60, 0, 0)
				Content_5.Font = Enum.Font.GothamBold
				Content_5.Text = cftextbox.Description
				Content_5.TextColor3 = Color3.fromRGB(100, 100, 100)
				Content_5.TextSize = 12.000
				Content_5.TextXAlignment = Enum.TextXAlignment.Left
				Content_5.TextYAlignment = Enum.TextYAlignment.Top
				TextboxFrame.Name = "TextboxFrame"
				TextboxFrame.Parent = Input
				TextboxFrame.AnchorPoint = Vector2.new(1, 0.5)
				TextboxFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				TextboxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextboxFrame.BorderSizePixel = 0
				TextboxFrame.Position = UDim2.new(1, -10, 0, 18)
				TextboxFrame.Size = UDim2.new(0, 150, 0, 20)
				UICorner_18.CornerRadius = UDim.new(0, 3)
				UICorner_18.Parent = TextboxFrame
				RealTextBox.Name = "RealTextBox"
				RealTextBox.Parent = TextboxFrame
				RealTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				RealTextBox.BackgroundTransparency = 1.000
				RealTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				RealTextBox.BorderSizePixel = 0
				RealTextBox.Position = UDim2.new(0, 30, 0, 0)
				RealTextBox.Size = UDim2.new(1, -30, 1, 0)
				RealTextBox.Font = Enum.Font.GothamBold
				RealTextBox.PlaceholderText = cftextbox.PlaceHolder
				RealTextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
				RealTextBox.Text = cftextbox.Default
				RealTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				RealTextBox.TextSize = 12.000
				RealTextBox.TextXAlignment = Enum.TextXAlignment.Left
				WritingIcon.Name = "WritingIcon"
				WritingIcon.Parent = TextboxFrame
				WritingIcon.AnchorPoint = Vector2.new(0, 0.5)
				WritingIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				WritingIcon.BackgroundTransparency = 1.000
				WritingIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				WritingIcon.BorderSizePixel = 0
				WritingIcon.Position = UDim2.new(0, 10, 0.5, 0)
				WritingIcon.Size = UDim2.new(0, 15, 0, 15)
				WritingIcon.Image = "rbxassetid://126409600467363"
				RealTextBox.FocusLost:Connect(function()
					cftextbox.Callback(RealTextBox.Text)
				end)
				cftextbox.Callback(RealTextBox.Text)
			end
			function SectionFunc:AddSlider(cfslider)
				local cfslider = Library:MakeConfig({
					Title = "Slider < Missing Title >",
					Description = "",
					Max = 100,
					Min = 1,
					Increment = 1,
					Default = 1,
					Callback = function() end
				}, cfslider or {})
				local SliderFunc = {}
				local Slider = Instance.new("Frame")
				local UICorner_11 = Instance.new("UICorner")
				local Title_5 = Instance.new("TextLabel")
				local Content_7 = Instance.new("TextLabel")
				local SliderBar = Instance.new("Frame")
				local UICorner_12 = Instance.new("UICorner")
				local SliderDraggable = Instance.new("Frame")
				local UICorner_15 = Instance.new("UICorner")
				local Circle = Instance.new("Frame")
				local UICorner_13 = Instance.new("UICorner")
				local SliderValue = Instance.new("TextLabel")
				Slider.Name = "Slider"
				Slider.Parent = SectionList
				Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Slider.BackgroundTransparency = 0.950
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.Size = UDim2.new(1, 0, 0, 60)
				UICorner_11.CornerRadius = UDim.new(0, 3)
				UICorner_11.Parent = Slider
				Title_5.Name = "Title"
				Title_5.Parent = Slider
				Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_5.BackgroundTransparency = 1.000
				Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_5.BorderSizePixel = 0
				Title_5.Position = UDim2.new(0, 10, 0, 0)
				Title_5.Size = UDim2.new(1, -60, 0, 18)
				Title_5.Font = Enum.Font.GothamBold
				Title_5.Text = cfslider.Title
				Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title_5.TextSize = 13.000
				Title_5.TextXAlignment = Enum.TextXAlignment.Left
				Content_7.Name = "Content"
				Content_7.Parent = Slider
				Content_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content_7.BackgroundTransparency = 1.000
				Content_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content_7.BorderSizePixel = 0
				Content_7.Position = UDim2.new(0, 10, 0, 20)
				Content_7.Size = UDim2.new(1, -60, 0, 0)
				Content_7.Font = Enum.Font.GothamBold
				Content_7.Text = cfslider.Description
				Content_7.TextColor3 = Color3.fromRGB(100, 100, 100)
				Content_7.TextSize = 12.000
				Content_7.TextXAlignment = Enum.TextXAlignment.Left
				Content_7.TextYAlignment = Enum.TextYAlignment.Top
				SliderBar.Name = "SliderBar"
				SliderBar.Parent = Slider
				SliderBar.AnchorPoint = Vector2.new(1, 0.5)
				SliderBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				SliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SliderBar.BorderSizePixel = 0
				SliderBar.Position = UDim2.new(1, -55, 0, 35)
				SliderBar.Size = UDim2.new(0, 150, 0, 8)
				UICorner_12.CornerRadius = UDim.new(1, 0)
				UICorner_12.Parent = SliderBar
				SliderDraggable.Name = "SliderDraggable"
				SliderDraggable.Parent = SliderBar
				SliderDraggable.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 178, 0, 254)
				SliderDraggable.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SliderDraggable.BorderSizePixel = 0
				SliderDraggable.Size = UDim2.new(0, 0, 1, 0)
				UICorner_15.CornerRadius = UDim.new(1, 0)
				UICorner_15.Parent = SliderDraggable
				Circle.Name = "Circle"
				Circle.Parent = SliderDraggable
				Circle.AnchorPoint = Vector2.new(0, 0.100000001)
				Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Circle.BorderSizePixel = 0
				Circle.Position = UDim2.new(1, -6, 0, 0)
				Circle.Size = UDim2.new(0, 12, 0, 12)
				UICorner_13.CornerRadius = UDim.new(1, 0)
				UICorner_13.Parent = Circle
				SliderValue.Name = "SliderValue"
				SliderValue.Parent = Slider
				SliderValue.AnchorPoint = Vector2.new(0, 0.5)
				SliderValue.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 178, 0, 254)
				SliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SliderValue.BorderSizePixel = 0
				SliderValue.Position = UDim2.new(1, -185, 0.5, 0)
				SliderValue.Size = UDim2.new(0, 35, 0, 20)
				SliderValue.Font = Enum.Font.GothamBold
				SliderValue.Text = "0"
				SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderValue.TextSize = 13.000
				SliderValue.TextScaled = true
				SliderValue.TextWrapped = true
				UICorner_13.CornerRadius = UDim.new(0, 3)
				UICorner_13.Parent = SliderValue
				Library:UpdateContent(Content_7, Title_5, Slider)
				local IsMoving = false
				SliderFunc.Value = cfslider.Default
				function SliderFunc:Update(x)
					local x_offset = math.clamp(x, 0, SliderBar.AbsoluteSize.X)
					local percent = x_offset / SliderBar.AbsoluteSize.X
					local value = math.floor((cfslider.Min + (cfslider.Max - cfslider.Min) * percent) / cfslider.Increment) *
						cfslider.Increment
					if value > cfslider.Max then
						value = cfslider.Max
					elseif value < cfslider.Min then
						value = cfslider.Min
					end
					SliderFunc.Value = value
					local final_percent = (value - cfslider.Min) / (cfslider.Max - cfslider.Min)
					local final_offset = SliderBar.AbsoluteSize.X * final_percent
					SliderDraggable.Size = UDim2.new(0, final_offset, 1, 0)
					SliderValue.Text = value
					cfslider.Callback(value)
				end
				SliderBar.MouseButton1Down:Connect(function(x)
					IsMoving = true
					SliderFunc:Update(x.Position.X - SliderBar.AbsolutePosition.X)
				end)
				SliderBar.MouseEnter:Connect(function()
					Circle.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 178, 0, 254)
					SliderDraggable.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 178, 0, 254)
					SliderValue.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 178, 0, 254)
				end)
				SliderBar.MouseLeave:Connect(function()
					Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderDraggable.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 178, 0, 254)
					SliderValue.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá (trước đây là 178, 0, 254)
				end)
				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if IsMoving and input.UserInputType == Enum.UserInputType.MouseMovement then
						SliderFunc:Update(input.Position.X - SliderBar.AbsolutePosition.X)
					end
				end)
				game:GetService("UserInputService").InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						IsMoving = false
					end
				end)
				SliderFunc:Update(
					(cfslider.Default - cfslider.Min) / (cfslider.Max - cfslider.Min) * SliderBar.AbsoluteSize.X)
				return SliderFunc
			end
			function SectionFunc:AddParagraph(cfpara)
				local cfpara = Library:MakeConfig({
					Title = "Paragraph < Missing Title >",
					Content = ""
				}, cfpara or {})
				local ParaFunc = {}
				local Paragraph = Instance.new("Frame")
				local UICorner_16 = Instance.new("UICorner")
				local Title_6 = Instance.new("TextLabel")
				local Content_4 = Instance.new("TextLabel")
				Paragraph.Name = "Paragraph"
				Paragraph.Parent = SectionList
				Paragraph.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Paragraph.BackgroundTransparency = 0.950
				Paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Paragraph.BorderSizePixel = 0
				Paragraph.Size = UDim2.new(1, 0, 0, 35)
				UICorner_16.CornerRadius = UDim.new(0, 3)
				UICorner_16.Parent = Paragraph
				Title_6.Name = "Title"
				Title_6.Parent = Paragraph
				Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_6.BackgroundTransparency = 1.000
				Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title_6.BorderSizePixel = 0
				Title_6.Position = UDim2.new(0, 10, 0, 0)
				Title_6.Size = UDim2.new(1, -60, 0, 18)
				Title_6.Font = Enum.Font.GothamBold
				Title_6.Text = cfpara.Title
				Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title_6.TextSize = 13.000
				Title_6.TextXAlignment = Enum.TextXAlignment.Left
				Content_4.Name = "Content"
				Content_4.Parent = Paragraph
				Content_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content_4.BackgroundTransparency = 1.000
				Content_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content_4.BorderSizePixel = 0
				Content_4.Position = UDim2.new(0, 10, 0, 20)
				Content_4.Size = UDim2.new(1, -60, 0, 0)
				Content_4.Font = Enum.Font.GothamBold
				Content_4.Text = cfpara.Content
				Content_4.TextColor3 = Color3.fromRGB(100, 100, 100)
				Content_4.TextSize = 12.000
				Content_4.TextXAlignment = Enum.TextXAlignment.Left
				Content_4.TextYAlignment = Enum.TextYAlignment.Top
				Library:UpdateContent(Content_4, Title_6, Paragraph)
				function ParaFunc:SetDesc(args)
					Content_4.Text = args
				end
				return ParaFunc
			end
			return SectionFunc
		end
		return TabFunc
	end
	local G2L = {};

	-- StarterGui.ScreenGui
	G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
	G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


	-- StarterGui.ScreenGui.ImageButton
	G2L["2"] = Instance.new("ImageButton", G2L["1"]);
	G2L["2"]["BorderSizePixel"] = 0;
	G2L["2"].Visible = true
	self:MakeDraggable(G2L["2"],G2L["2"])
	-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
	G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["2"]["Image"] = [[rbxassetid://124762714875426]];
	G2L["2"]["Size"] = UDim2.new(0, 50, 0, 50);
	G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2"]["Position"] = UDim2.new(0,10,0,10);
	G2L["2"]["BackgroundTransparency"] = 1;
	local a = G2L["2"]
	a.MouseButton1Click:Connect(function()
		DropShadowHolder.Visible = not DropShadowHolder.Visible
	end)
	return Tab
end

return Library