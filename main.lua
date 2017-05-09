-- 龙之谷
local sz = require("sz")
require("TSLib")
init(1)

-- 任务界面相关判断--          

function star_game(...)


	function mission_nowstart(...) -- 0-6级任务中

		function moveto_target(...) --有目标出现时，移向目标
			local x,y = findMultiColorInRegionFuzzy( 0xddffff, "0|34|0xd4ffff,0|48|0xebffff", 90, 15, 14, 1135, 639)  --判断光柱位置
			local x,y = findMultiColorInRegionFuzzy( 0xfcac00, "4|0|0xeea200,7|0|0xf4a700", 90, 0, 0, 1135, 639) --判断地图碎片位置1
			local x,y = findMultiColorInRegionFuzzy( 0xffda4b, "10|0|0xffce49,4|5|0xffd84b", 90, 0, 0, 1135, 639) --碎片位置2
			local x,y = findMultiColorInRegionFuzzy( 0xfeae00, "14|0|0xfeae00,39|0|0xfead00", 90, 0, 0, 1135, 639) --碎片位置3
			local x,y = findMultiColorInRegionFuzzy( 0xeff0f0, "-14|-4|0xeaeaeb,-3|14|0xececec", 90, 617, 279, 713, 356)  --判断指示箭头往右前方指（第四级强边不动1
			local x,y = findMultiColorInRegionFuzzy( 0x696f74, "-13|-3|0x686c71,-2|14|0x5f6469", 90, 617, 279, 713, 356)  --判断指示箭头往右前方指（第四级强边不动2
			local x,y = findMultiColorInRegionFuzzy( 0xf6f6f6, "-15|-4|0xf3f3f3,-2|15|0xd7d7d8", 75, 617,280, 698,351) --判断指示箭头往右前方指（第四级强边不动2
			if x~=-1 and x>15 and x<1100 then
				while (x~=-1) and (y~=-1) and (x>15) and x<1100 do 
					local x,y = findMultiColorInRegionFuzzy( 0xddffff, "0|34|0xd4ffff,0|48|0xebffff", 90, 15, 14, 1135, 639)  --判断光柱位置
					local x,y = findMultiColorInRegionFuzzy( 0xfcac00, "4|0|0xeea200,7|0|0xf4a700", 90, 0, 0, 1135, 639) --判断地图碎片位置
					local x,y = findMultiColorInRegionFuzzy( 0xffda4b, "10|0|0xffce49,4|5|0xffd84b", 90, 0, 0, 1135, 639) --碎片位置2
					local x,y = findMultiColorInRegionFuzzy( 0xfeae00, "14|0|0xfeae00,39|0|0xfead00", 90, 0, 0, 1135, 639) --碎片位置3
					local x,y = findMultiColorInRegionFuzzy( 0xeff0f0, "-14|-4|0xeaeaeb,-3|14|0xececec", 90, 617, 279, 713, 356)  --判断指示箭头往右前方指（第四级强边不动1
					local x,y = findMultiColorInRegionFuzzy( 0x696f74, "-13|-3|0x686c71,-2|14|0x5f6469", 90, 617, 279, 713, 356)  --判断指示箭头往右前方指（第四级强边不动2
					local x,y = findMultiColorInRegionFuzzy( 0xf6f6f6, "-15|-4|0xf3f3f3,-2|15|0xd7d7d8", 75, 617,280, 698,351) --判断指示箭头往右前方指（第四级强边不动2
					if x<15 or x>1100 then
						break
					end
					local pos=sz.pos
					local p0=pos(540,378)   --角色移动起始点
					local p1=pos(x,y)
					p0:touchMoveTo(p1,2,500,1)
				end
			end
		end
		function move_up(...)
			touchDown(150, 470);    --在坐标 (150, 550)按下
			mSleep(1000);
			touchMove(150, 420);    --移动到坐标 (150, 600)，注意一次滑动的坐标间隔不要太大，不宜超过50像素
			mSleep(1000);
			touchUp(150, 420);  --在坐标 (150, 600) 抬起
		end

		function fight_tap(...)
			local function tap_center(...)
				mSleep(500)
				tap(997,501)
				mSleep(500)
			end
			tap_center()
			tap(878,590)  --点左下角大招
			tap_center()
			tap(880,503)
			tap_center()
			tap(917,418)
			tap_center()
			tap(1000,388)
			tap_center()
			tap(1088,384)
			tap_center()
		end

		function run_mission(...)
			moveto_target()

			while (true) do
				if not multiColor({{75,141,0xfefefe}, {85,141,0xfefefe}, {92,141,0xffffff}, {104,141,0xffffff}}) then  --判断是否3D视角
					tap(87,144)
					mSleep(1000)
					tap(28,87)
				end
				if multiColor({{532,503,0xf6e9c7}, {601,501,0xf6e9c7}, {669,504,0xf6e9c7}}) then  --判断有没有妹子解说
					tap(1080,584)
					mSleep(1000)
				end
				x,y = findMultiColorInRegionFuzzy( 0xffffff, "2|-18|0xfefffe,2|44|0xffffff", 97, 0, 0, 1135, 639)  --判断有么有目标出现
				if x==-1 then
					if multiColor({{181,209,0x434170}, {199,224,0x404264}, {269,258,0x414164}, {752,273,0x393e51}}) or multiColor({{315,51,0x463254}, {335,181,0x2e233c}, {361,183,0x160f1a}, {398,168,0x16101a}}) or multiColor({{270,253,0x47466e}, {270,273,0x353652}, {750,308,0xa56f5f}, {751,323,0xad7562}}) then  --5级魔兽变身卡点
						local pos = sz.pos
						local p4 = pos(356,236)
						local p5 = pos(356,411)
						p4:touchMoveTo(p5, 2, 6000, 1) -- 从点 p2 滑动到 p3, 后面三个可选参数依次为：步长、弹起延迟、每步延迟
					end
					if multiColor({{732,50,0x33435a}, {788,52,0x344860}, {732,109,0x334656}, {781,113,0x30414c}}) then  --判断第四级在墙边卡主，向左划四秒钟，判断点窗户墙四个点
						local pos = sz.pos
						local p2 = pos(187,327)
						local p3 = pos(396,327)
						p2:touchMoveTo(p3, 2, 4000, 1) -- 从点 p2 滑动到 p3, 后面三个可选参数依次为：步长、弹起延迟、每步延迟
					end
					move_up()
				elseif not isColor(668,317,0xeff0f1) then  --增加没有路标箭头出现才打的判断
					fight_tap()
				end
				if multiColor({{137,19,0x000000}, {302,23,0x000000}, {513,26,0x000000}, {743,31,0x000000}}) or multiColor({{317,26,0xfffae9}, {385,19,0x6ecd45}, {460,21,0x6bca43}}) or multiColor({{518,102,0x29293c}, {614,100,0x303041}, {509,526,0x676fad}, {617,526,0x52598b}}) or multiColor({{732,50,0x33435a}, {788,52,0x344860}, {732,109,0x334656}, {781,113,0x30414c}}) or multiColor({{315,51,0x463254}, {335,181,0x2e233c}, {361,183,0x160f1a}, {398,168,0x16101a}}) then  --判断打完了没有，退出runmission
					break
				end
			end

		end

		--判断是否是执行任务界面且非自动游戏
		if multiColor({{24,136,0xffffff}, {39,136,0xffffff}, {84,129,0xffffff}, {84,135,0xfbfbfb}, {84,142,0xfafaf9}}) or multiColor({{24,135,0xffffff}, {39,135,0xffffff}, {172,117,0xcac9c9}, {182,116,0xcfcece}}) or multiColor({{25,135,0xffffff}, {40,135,0xffffff}, {137,134,0xfcfcfc}, {143,134,0xfcfcfc}}) or multiColor({{32,143,0xffffff}, {75,141,0xfefefe}, {85,141,0xfefefe}, {91,141,0xffffff}, {102,141,0xffffff}}) and not multiColor({{139,124,0xf6f6f6}, {139,133,0xf5f5f5}, {163,139,0xf2f2f2}, {163,149,0xf2f2f2}}) and not multiColor({{130,119,0xf6e9c7}, {130,145,0xf6e9c7}, {176,145,0xf6e9c7}, {176,119,0xf6e9c7}, {130,122,0xf6e9c7}}) then
			run_mission()
		end
	end

	function talk_on(...)  --判断是否谈话
		if multiColor({{565,445,0xf9e0a9}, {595,445,0xfae1a9}, {646,445,0xfae1a9}}) then  
			tap(646,445)
			mSleep(500)
		end
	end

	function chose_mission(...)  --任务地图选择任务，判断感叹号位置
		x,y = findMultiColorInRegionFuzzy( 0xc40210, "-2|7|0xb9050e,-4|12|0xbd030d", 90, 0, 0, 1135, 639)
		if x~=-1 then
			tap(x,y)
		end
	end

	function sweep_floor(colors) --扫屏函数，放入判断颜色即开始扫
		for i=60,615,50 do
			if multiColor(colors,100) then
				for p=30,1115,50 do
					if multiColor(colors,100) then
						tap(p,i)
					else
						break
					end
				end
			else
				break
			end

		end
	end

	function back_up(...) --判断是否点左上角退回按钮
		multiColTap({{787,27,0xfeeaac}, {948,27,0xfeeaac}, {611,426,0xafafaf}, {33,47,0x000000}}) --精灵返回
		multiColTap({{628,28,0xfeeaac}, {789,27,0xfeeaac}, {455,583,0x8f5c1b}, {35,46,0x020007}}) --角色返回
		multiColTap({{970,571,0xe1e1e3}, {970,586,0xe1e1e2}, {982,586,0xcfcfd4}, {1000,587,0xd2d2d6}, {1000,571,0xe1e2e3}, {1016,578,0xe2e2e3}}) --组件队伍，快速开始
		multiColTap({{463,184,0xfae1aa}, {675,184,0xfae1aa}, {524,401,0x686fae}, {614,401,0x575e92}, {567,436,0x343a61}}) --到8小时提示休息

	end

	function sweep_halo(...)  --领任务界面出现光圈

		sweep_floor({{313,25,0x838078}, {388,29,0x838078}, {444,37,0x838078}})
		back_up()
		--人物属性更改（装备
		sweep_floor({{629,28,0x827858}, {788,27,0x827858}, {948,28,0x827858}})  --取头上3点变暗判断
		back_up()
		--领装备
		sweep_floor({{127,118,0x2f0e04}, {130,190,0x120d0c}, {127,263,0x120d0c}, {126,337,0x120d0c}})
		back_up()
		--人物属性更改（物品制作
		sweep_floor({{789,28,0x827858}, {949,28,0x827858}})
		back_up()
		--进入属性或啥的最后一个是否判断
		sweep_floor({{789,28,0x343023}, {949,27,0x343023}})
		back_up()
		--进入战场
		sweep_floor({{629,29,0x17150f}, {788,27,0x17150f}, {692,93,0x151520}, {649,154,0x7f7a6d}})
		back_up()
		--在QQ登陆情况下，任务村需要扫屏
		sweep_floor({{309,29,0x838078}, {375,26,0x295a78}, {441,30,0x275776}})
		back_up()
	end

	--游戏开始阶段的语句
	if multiColor({	{524,98,0x29293a}, {616,98,0x2e2e3f}, {565,537,0xfbfbfb}}) then  --进入游戏，会有公告通知，直接关闭
		tap(565,537)
		mSleep(1500)
	end
	if multiColor({{468,450,0xfefec3}, {684,450,0xffffc3}, {565,573,0xf78000}}) then  --公告后进入游戏
		tap(565,573)
		mSleep(1500)
	end
	if multiColor({{47,67,0x2e2830}, {256,70,0x332827}, {1027,592,0x4a527e}}) then  --点击右下角“开始游戏”并在这之前切换下名字
		tap(705,592) --切换名字
		mSleep(1000)
		tap(1027,592)
		mSleep(1500)
	end


	--在任务村阶段的语句+任务地图阶段的语句
	sweep_halo()
	multiColTap({{564,433,0x353a63}, {444,175,0xf5dba3}, {725,175,0xf5daa3}})  --休息提醒确认
	if multiColor({{421,69,0xfae1aa}, {661,69,0xfae1aa}, {568,527,0x3b416c}}) then --进入领任务界面有广告提示（比如情人节啥的
		tap(568,527)
		mSleep(1500)
	end
	if multiColor({{326,21,0xe6b34b}, {385,19,0x6ecd45}, {447,36,0xfffae9}}) or multiColor({{313,25,0xfffae9}, {392,23,0x52b2ee}, {466,25,0x51b0ec}}) then --判断在任务界面并点击任务
		tap(105,205)
		mSleep(1500)
	end
	multiColTap({{473,175,0xf5dba3}, {673,175,0xf5daa3}, {700,427,0xfbfbfc}, {428,429,0xedeeee}}) --强行闯关判断
	if multiColor({{626,27,0xfeeaac}, {788,27,0xfeeaac}, {151,94,0xf21313}}) then--技能点页面增加技能
	tap(300,134)  --挨个点技能增加
	mSleep(600)
	tap(823,599)
	tap(429,134)
	mSleep(600)
	tap(823,599)
	tap(564,137)
	mSleep(600)
	tap(823,599)
	tap(303,297)
	mSleep(600)
	tap(823,599)
	tap(430,295)
	mSleep(600)
	tap(823,599)
	tap(561,298)
	mSleep(600)
	tap(823,599)
	tap(300,461)
	mSleep(600)
	tap(823,599)
	tap(428,458)
	mSleep(600)
	tap(823,599)
	tap(560,466)
	mSleep(600)
	tap(823,599)
	mSleep(1000)
	while isColor(150,95,0xb38b5d) do
	tap(40,49)
	mSleep(1000)
	end
end
if multiColor({{259,601,0xf21313}, {260,595,0xf21313}, {253,600,0xf21313}}) then  --第一个宝物箱，根据红点判断
	tap(253,600)
	mSleep(1500)
	multiColTap({{510,181,0x2a2a3e}, {625,180,0x27273e}, {569,413,0x4e5583}})  --点击领取
end
if multiColor({{478,90,0x29293a}, {710,88,0x28283c}, {943,520,0x484d78}}) then  --出现接受任务横幅并入场
	tap(943,520)
	mSleep(1500)
end
multiColTap({{211,139,0xf6e9c7}, {193,516,0xfff7c0}, {989,95,0x282d4e}}) --脚本误点，出现设置界面关闭
multiColTap({{471,193,0xd9b27c}, {660,196,0xe6c588}, {570,428,0x353b63}}) --确认领取奖励
multiColTap({{575,78,0xf21717}, {575,89,0xf21313}, {575,84,0xf21313}})   --副本深渊第一个奖励
multiColTap({{260,113,0x181214}, {252,152,0x7f7a6d}, {247,220,0x7e7866}, {848,520,0x4c5382}}) --进入关卡
chose_mission()  --在地图中选择去哪个地方执行任务

--各阶段通用语句
for i=1,10 do   -- 判断有无对话，如果有对话走10遍
	talk_on()
end
if multiColor({{935,18,0x000000}, {1008,38,0x000000}, {1079,58,0x000000}}) then  --出现过场动画，跳过，判断位置上面出现三个黑点
	tap(1079,58)
	mSleep(1500)
end


--0-6级打怪中
mission_nowstart()



--6级以后自动打怪
if multiColor({{23,136,0xffffff}, {39,136,0xffffff}, {141,140,0xeeeeee},{149,130,0xdadada}}) or multiColor({{139,124,0xf6f6f6}, {139,133,0xf5f5f5}, {163,139,0xf2f2f2}, {163,149,0xf2f2f2}}) then  --判断是否自动战斗，不是就开启
	tap(149,130)
	mSleep(1500)
end


end




while (true) do
	star_game()
end