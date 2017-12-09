import Data.Maybe
import Data.Char

-- |Names of registers
type Name = String

-- |Saves a value for each register
type Values = [(Name, Int)]

-- |Instruction - 
--  register_name
--  inc/dec
--  number
--  if
--  register_name/number
--  > / < / == / <= / >= / !=
--  register_name/number
type Instruction = [String]

-- |List of instructions
type Instructions = [Instruction]

-- |Parsed instruction - register's name, value to INCREASE, and whether to do it
type Parsed = (Name, Int, Bool)

inputString :: String
inputString = "hwv inc 149 if clj >= -5\nor inc 530 if hwv > 144\nd inc 131 if f < 1\ngnz dec -236 if jp != 0\nmu dec 266 if sp >= -6\nt inc -146 if w >= 8\nw dec 825 if jp != 3\ncto dec 403 if ino != 0\nino inc 17 if sp != 0\nbt inc -341 if sp != 6\nvv dec 824 if clj >= -9\nmu inc -371 if gnz < -7\nf dec 865 if w > -828\ncto inc 588 if noj == 0\nmvh inc 484 if noj == 0\nino inc -728 if gnz > -6\nor inc -795 if nm >= -9\nq dec -87 if or != -274\nq dec -889 if q > 80\nf dec 155 if t <= -3\nor dec 185 if nm < 9\nw inc -243 if mu > -276\nmu inc 798 if clj == 0\nuc dec -499 if mu > 527\nino dec -487 if ly <= 2\nw dec 562 if nm > -9\nq dec 607 if or == -454\njp inc 995 if ooh != -10\nw inc 122 if gnz >= -5\nsp dec -321 if l <= 2\nl dec 319 if mu < 542\nbt inc -389 if hwv == 146\nbt inc -799 if noj == 0\nq dec 231 if gnz >= -9\nw inc -451 if clj == 8\nnm dec -986 if l == -319\ngnz inc 395 if cto < 593\nnm inc 790 if uix <= 4\nmvh dec 568 if ino == -241\nbt dec -583 if l != -315\nl dec 779 if jp > 998\nuix inc 28 if vv < -816\nuix dec 524 if uix == 28\nor inc -125 if bt > -558\nclj dec -368 if uc >= 500\nnoj inc 744 if uc > 489\nliq dec -931 if f > -862\nbt dec -785 if cto < 593\nnm inc 557 if ooh >= 3\nclj dec -238 if bt <= 222\nooh inc 76 if f <= -870\nq dec 535 if vv > -832\nvv dec 572 if liq < 6\nnm dec -877 if hwv <= 158\nly dec -61 if ooh != 0\nmu dec 122 if hwv >= 145\nt dec -73 if nm < 2656\nq dec -986 if ino >= -247\nsp dec 847 if ooh >= 2\nt inc -644 if mu >= 405\nw dec 682 if or == -575\ncto dec 355 if clj <= 9\nmu dec -258 if sp < 328\nnoj inc 418 if cto <= 242\njp dec 94 if ly != -10\nliq dec 286 if liq == 0\nmvh inc -286 if q == 1196\nly inc -429 if l >= -311\nvv dec -122 if cto >= 224\nnoj inc -11 if liq == -286\nnm inc 306 if uix >= -487\nt dec 348 if nm > 2653\nw dec -100 if bt != 238\nd inc 614 if vv >= -1282\nnm inc -488 if bt != 222\nl dec 410 if l != -319\nmu dec -416 if ly >= -2\nl inc -435 if vv < -1270\nbt dec -83 if cto <= 232\njp inc -208 if ly <= 6\nmu inc -761 if sp <= 327\nhwv dec -501 if nm != 2164\nmu inc -851 if vv >= -1280\nq inc -270 if ooh != 1\nor dec -260 if or <= -578\nooh dec 859 if d <= 750\nd inc -343 if vv > -1279\nw dec -817 if cto != 228\nnoj inc 437 if nm <= 2158\njp dec -205 if nm != 2157\nuc inc 823 if bt != 231\nhwv inc 363 if uc != 1315\nly inc 899 if ly == 0\nuix dec 912 if ooh < -852\nq dec 52 if clj == 0\nbt dec -242 if ooh > -868\nnoj inc 798 if ino != -232\nuc dec -926 if uix == -1408\nsp dec -918 if hwv > 1004\nly dec 855 if or == -575\nclj inc 575 if bt == 466\nt inc -894 if hwv > 1003\nq inc -377 if q == 874\nor dec 541 if gnz != 398\nuix dec -152 if vv != -1276\nw dec -673 if uc <= 2255\nmvh inc -870 if bt > 469\nor inc -458 if gnz > 387\nl dec 99 if gnz <= 404\nmu dec 727 if bt < 477\nbt dec 231 if l >= -844\nmu inc -239 if ooh > -861\nw inc -333 if t != -1456\nliq dec 534 if w < -927\nq inc -688 if w == -933\nl inc -533 if f < -860\nt dec 781 if liq == -825\nly dec 319 if hwv < 1014\nly dec -333 if cto < 237\nmvh inc 606 if hwv >= 1011\nuc dec 331 if ly == 54\nhwv inc -802 if hwv < 1018\nd inc -457 if nm != 2162\nq inc -159 if uix >= -1265\njp inc -305 if uc < 2250\njp dec 285 if mu == -1494\nnm dec -244 if f < -855\ncto inc -431 if cto < 236\nf dec -343 if gnz >= 393\nt inc 311 if noj >= 1948\nuix inc -41 if l < -1385\nnoj inc 3 if w < -932\nino inc 785 if bt > 466\nl dec -868 if vv > -1281\nl dec -704 if t == -1154\nnoj inc 485 if ooh > -868\nor inc -724 if w < -936\nooh dec 913 if nm == 2409\nhwv inc -201 if nm < 2418\nly dec 296 if ly != 48\nclj dec -800 if or < -1578\nbt inc -465 if cto > -198\nbt inc -811 if clj > -5\nl dec -118 if d >= -62\ncto dec -748 if hwv < 17\nclj dec -781 if uix >= -1302\njp dec -917 if or >= -1575\nbt inc 787 if l <= 308\nq dec 270 if jp != 1224\nuc inc 552 if ly >= -244\nf dec -728 if noj <= 2434\nw inc 819 if ly < -229\nt inc -891 if nm >= 2409\nly dec -52 if q == -620\nino dec 440 if gnz > 388\nt inc -580 if or != -1581\nbt inc -204 if jp == 1225\nl dec -478 if w < -110\nnoj dec -992 if gnz <= 388\nq inc -370 if ino <= 98\nnoj inc -15 if cto == 550\nw inc 327 if d > -63\nor dec -742 if hwv != 7\nw inc 13 if vv < -1282\nor inc 748 if q != -610\nbt inc 272 if cto == 550\nly inc -32 if cto < 558\nmu inc -524 if bt > 510\nor inc -155 if ooh > -1766\nw inc -473 if w > 209\nnoj inc -651 if bt <= 514\nuc inc -665 if or == -84\nliq dec 988 if bt > 508\nvv dec 37 if ly >= -227\nf dec 498 if mu <= -2018\nq dec -765 if jp <= 1223\nnm inc 838 if bt < 522\nnoj inc 614 if nm == 3247\nl dec 887 if or > -90\ngnz dec -842 if or != -87\nvv dec 558 if nm < 3250\nly inc -132 if t > -2633\nooh inc -381 if t >= -2634\nbt inc 586 if gnz >= 1237\nclj dec 627 if ooh == -2143\nnoj dec 631 if clj < 789\nd dec 137 if or > -94\njp inc 568 if jp >= 1223\nl inc -125 if w <= -255\ngnz dec -108 if q > -621\nclj inc 533 if or > -85\nmvh dec 643 if clj == 1314\nooh dec -549 if clj != 1307\nf inc 573 if ooh < -1594\nd inc -369 if noj != 1763\nor inc -962 if ino == 104\nuc dec -667 if bt != 1092\nmvh dec 816 if ly < -349\ncto inc -804 if bt == 1100\nuc inc 78 if sp <= 1245\nhwv dec 62 if jp < 1801\ngnz inc 238 if ino != 103\nq dec 488 if liq <= -1800\nvv dec -969 if liq > -1814\nw dec 554 if f >= -449\nsp dec 137 if mu == -2018\nuc dec 880 if q >= -1117\nq inc 221 if mu >= -2019\nd dec -691 if mvh != -2102\nor dec -786 if cto <= -255\nooh inc -738 if q == -896\nnm inc -458 if liq == -1808\nt dec -719 if ooh != -1604\nl dec -164 if sp != 1096\nly inc -857 if l > -74\nliq dec -30 if w != -805\njp inc -410 if w > -821\nnm dec -882 if q >= -890\nw inc 818 if nm <= 3661\nliq dec -502 if w == -814\nsp inc -58 if sp < 1107\nq dec -405 if w > -820\nnoj inc -57 if t != -2625\ncto dec -14 if ly < -1204\nmu inc 525 if mu <= -2010\nw dec -452 if mvh != -2090\nly dec 276 if mu <= -1488\nuc inc -919 if f <= -446\nooh inc 608 if hwv < -51\nsp inc -549 if ooh > -1000\nd dec -441 if mu >= -1501\nuc inc -809 if q < -481\nd dec 740 if uix == -1288\nuix dec 951 if ooh > -1000\nvv dec -902 if gnz > 1579\nclj inc 359 if sp >= 490\nmu dec 479 if q < -487\nnoj dec -882 if ly <= -1480\nt dec -161 if l <= -66\nclj inc 381 if f >= -455\nbt dec -593 if hwv <= -49\nnoj dec 386 if or == -1046\nuc dec -220 if noj < 2258\nnoj inc 463 if nm == 3671\nmvh inc 607 if ooh > -998\nliq dec -641 if noj <= 2714\nmvh inc -711 if sp == 495\nsp inc -417 if t > -2471\nnm dec -863 if liq > -640\nnoj dec -115 if gnz < 1591\nuc inc 645 if uix > -2243\nmvh inc 809 if gnz > 1582\nor inc 43 if clj > 2047\nliq inc -367 if cto != -242\nnoj dec -544 if jp >= 1378\nl inc 670 if uix > -2253\nw dec 966 if nm != 4541\nnoj dec 567 if q != -476\nvv inc 400 if nm >= 4532\nsp dec -298 if vv < 405\nmvh dec 439 if l == 604\nor inc 872 if uix < -2242\nvv dec 916 if uc == 492\nvv inc 391 if mvh < -1836\nliq inc -750 if f < -444\nmu dec -887 if ly >= -1483\nvv dec 850 if or >= -132\ngnz dec -394 if jp == 1383\ngnz inc 792 if nm >= 4531\nt dec 624 if hwv != -60\nliq dec -823 if nm >= 4525\nino inc 63 if nm != 4544\nsp dec -48 if t == -3088\nvv inc 909 if mvh < -1830\nt dec 334 if w <= -1327\nq inc -458 if d <= 572\nor inc 461 if f < -445\nor inc -180 if l == 604\njp dec 550 if uix <= -2242\nclj dec -574 if cto < -231\nino dec 78 if or == 150\nt inc -717 if l > 600\nsp dec 985 if liq <= -921\nhwv inc 268 if uix != -2241\nuix dec -318 if liq > -936\ncto inc -771 if or != 153\nclj dec 333 if vv <= -1357\nuc dec 686 if bt <= 1700\nly dec 999 if noj <= 2808\nliq inc 395 if hwv >= 213\nuc dec -762 if uix <= -1936\nl inc -434 if mvh < -1826\nq inc 238 if nm < 4540\nq dec -103 if ooh != -997\nbt dec 847 if hwv <= 213\nooh inc 720 if or < 155\nmu inc 744 if noj < 2811\nor inc -118 if d >= 570\nsp dec 329 if d <= 575\nino dec -479 if hwv >= 209\nuix dec 327 if vv != -1368\nnoj dec 53 if cto > -1015\nhwv inc 26 if liq < -524\nor inc -293 if w != -1326\nor inc -476 if clj == 2295\nuix dec -135 if hwv < 252\nnm inc -874 if noj > 2757\nbt inc -153 if l == 170\nq inc 639 if bt <= 1547\nl dec -919 if l <= 177\nnm inc -432 if w < -1327\nly inc -691 if vv <= -1360\ngnz inc 193 if t != -4135\nw dec -925 if uix == -2122\nl inc -576 if bt == 1540\nuc inc 978 if q > 35\nmu dec 3 if mu <= 141\ngnz inc -759 if q < 41\nhwv inc 344 if uix == -2126\nt inc -771 if nm != 4110\nt dec -95 if nm > 4092\nnm dec -600 if jp > 825\nly dec -38 if noj > 2751\njp inc 545 if uix > -2126\nf dec 40 if mvh <= -1820\nmvh dec -694 if or != -738\nnoj dec -182 if ooh >= -279\nw inc 621 if l >= 510\nq inc 568 if f < -493\nmvh dec -35 if liq <= -541\nmvh dec 951 if bt <= 1546\nliq inc 308 if cto < -1002\nsp inc 617 if ooh > -268\nino dec 155 if d == 571\nsp dec -135 if liq <= -234\nw dec 984 if ly <= -3129\nd inc 821 if mvh <= -2077\nw inc 99 if vv == -1364\nliq inc -266 if d <= 1393\nw inc -180 if ooh == -276\ngnz dec -539 if vv == -1364\nliq inc 337 if nm <= 4711\nl dec 640 if noj > 2927\nvv dec 511 if ly == -3135\nclj inc 315 if uix >= -2125\nl dec -581 if uix == -2119\nl inc 698 if ly >= -3135\nhwv inc -94 if jp >= 1376\nt dec -832 if or <= -729\ncto dec 584 if gnz > 2737\nt dec -676 if bt >= 1531\nor dec 946 if sp > -893\nt inc -814 if vv == -1875\nw dec 902 if mvh != -2079\nd dec -415 if w <= -1742\nnoj inc -336 if vv <= -1867\nw dec 693 if uc == 784\nuix inc -1 if ooh != -271\nsp dec -578 if jp == 1378\nvv inc -423 if or >= -1687\ncto dec -615 if cto > -1603\nliq inc 262 if vv < -2297\nvv inc -951 if noj <= 2598\nbt inc -435 if mu > 132\ngnz inc 956 if gnz > 2734\nhwv dec 607 if ino <= 407\nmu inc 934 if vv == -3249\nsp inc -972 if nm >= 4693\nsp dec -760 if l != 563\nl dec -197 if l > 569\nclj dec -187 if liq <= 103\nbt dec -725 if ino >= 411\nd inc 450 if clj != 2609\nbt inc 772 if jp == 1378\ngnz dec -959 if uix > -2132\ngnz dec 162 if mu != 1061\nd inc 701 if mvh != -2084\nt inc 335 if ly <= -3131\nw dec -491 if vv >= -3250\nor dec 808 if d < 2260\nmvh inc -824 if vv != -3240\nhwv dec 79 if liq >= 115\ncto inc 284 if f > -492\nuix dec 675 if gnz != 4494\nly inc 560 if clj == 2610\nly dec 507 if clj >= 2605\nmvh dec -354 if ino != 415\nsp inc 267 if mvh == -2554\nino dec 247 if uc > 780\nooh inc -566 if jp >= 1372\nliq dec -634 if mvh > -2557\nclj dec 230 if q < 42\nuix dec -502 if ino < 167\nuc inc -69 if q <= 47\nmvh inc -38 if ino > 158\nd dec -36 if clj >= 2378\nor inc 803 if uc != 725\nly inc 121 if uix < -2297\njp inc -349 if uix >= -2289\nmu dec -104 if or < -1682\njp dec -120 if hwv > 147\nmvh inc 376 if nm > 4694\ncto inc 286 if or >= -1696\ncto inc -586 if or < -1688\ngnz inc -39 if liq != 745\nq dec 422 if mu == 1173\ncto inc -984 if ino == 166\nf dec 208 if l < 776\nq inc 514 if l == 768\nl dec 458 if mu == 1173\njp dec 583 if w <= -1958\nly dec -932 if d < 2297\nor inc 449 if mvh > -2212\nliq dec 626 if t < -3779\nuc inc -933 if ino > 172\nhwv inc 760 if or == -1688\nhwv inc -911 if or < -1683\nclj dec 302 if q > 123\nvv inc 19 if ino > 169\nly inc 520 if w > -1953\nclj dec -54 if or <= -1680\nvv inc 22 if l > 310\nmu dec -341 if liq >= 109\nw inc 186 if gnz == 4456\nbt dec 418 if jp >= 1494\ngnz dec 514 if ly <= -1629\nmvh inc 284 if d > 2290\nsp dec 351 if q <= 139\nuc dec 135 if jp != 1498\nmvh dec 822 if cto != -1394\nf inc -934 if w == -1765\nd inc -699 if l == 301\nliq inc -768 if mvh != -1927\nt dec -882 if ooh != -835\nmu dec -469 if vv != -3242\nbt dec -612 if t > -2909\nmvh dec -417 if mvh <= -1941\nly inc -816 if or < -1683\nly inc -708 if uix <= -2289\nor inc -60 if jp > 1493\nbt inc 985 if ino >= 175\nvv dec -587 if clj > 2139\nnoj inc -806 if sp >= -617\nt dec -621 if l > 302\nt inc 396 if uc == 715\nsp inc -217 if w > -1767\nq inc -965 if ooh != -842\nq dec 892 if gnz <= 3943\nhwv inc -482 if nm == 4702\nf inc 213 if ooh < -837\nino dec -433 if q > -770\nino inc -791 if ly != -3151\nvv dec -467 if uc < 721\nsp dec -501 if ino != -184\nuc inc 382 if clj < 2127\nbt dec -983 if sp <= -319\nt dec -127 if ooh >= -850\nmvh dec 41 if d == 2293\nd dec -786 if cto > -1395\ngnz dec -444 if mvh <= -1970\nhwv dec -802 if clj < 2140\nclj inc 775 if clj >= 2132\nuc dec 986 if mu != 1981\nnoj inc 917 if bt != 3779\nuix inc -376 if nm >= 4702\nhwv inc 339 if cto != -1390\nuix dec -300 if vv < -2791\nuc inc -777 if ooh != -852\nt inc -141 if uc >= -1055\nw inc 491 if ooh < -833\nd dec 8 if w <= -1265\njp dec 789 if cto > -1400\nliq dec -255 if mvh == -1973\nnm dec 452 if d < 3067\nnoj inc 570 if jp <= 717\nq inc 591 if t == -1901\nd dec -594 if ly <= -3151\ngnz inc -267 if nm < 4703\nly dec -99 if uc > -1039\nl dec -849 if cto > -1392\nbt inc -389 if hwv > 664\nly inc 575 if bt != 3779\nclj dec 93 if l < 314\ngnz dec 60 if or > -1754\nq inc 396 if ino < -182\nnoj dec 634 if nm > 4695\nt dec -44 if vv <= -2781\nf inc 58 if d >= 3663\nmvh inc -575 if w >= -1283\nclj dec -526 if ooh == -840\ngnz dec 37 if uix <= -2675\nooh dec 39 if w > -1275\nhwv dec 902 if mvh == -2548\nino dec 390 if liq >= -401\nvv dec 942 if d < 3666\nly dec 482 if or >= -1752\nclj inc -667 if d >= 3659\ngnz inc 797 if noj < 1733\nl inc -379 if hwv > -251\nclj dec 328 if vv < -3718\nmu dec -629 if mvh > -2545\nuc dec -539 if sp == -324\nhwv dec -728 if ly <= -3629\nliq inc 191 if hwv <= 478\nl inc -153 if t == -1857\nvv inc 146 if clj != 1813\njp inc 334 if cto < -1384\nd dec 740 if sp >= -326\nf inc 907 if w >= -1282\nvv inc -448 if t == -1857\nclj dec 751 if or >= -1748\nuc inc 716 if gnz >= 4847\nl dec 417 if hwv <= 476\nuc dec 780 if f == -451\nq dec 310 if hwv == 482\nuix dec -254 if gnz > 4855\nooh inc -998 if uc <= -569\nf dec 645 if t == -1857\nw dec -513 if liq <= -392\nmu dec -489 if cto <= -1388\nf dec -40 if uix > -2423\nf inc 908 if mvh > -2554\nnoj inc 353 if l > -225\nmvh dec 31 if ooh <= -1871\nliq dec -20 if or < -1755\nclj dec 113 if d < 2931\nmvh dec -29 if gnz == 4856\njp dec 548 if liq < -394\nuc inc 534 if jp < 500\nclj dec 251 if uix >= -2419\nooh dec -154 if sp < -316\nl dec -512 if t == -1857\nl dec 113 if ly <= -3632\nl dec 920 if sp <= -323\nmvh dec 946 if hwv > 480\nuix inc -425 if uix >= -2425\nsp dec -209 if f == -148\nclj dec -760 if w <= -753\nnoj dec 65 if cto < -1392\nf inc 157 if mu != 2479\ncto inc 481 if bt != 3782\ncto dec 783 if liq <= -394\nooh dec -854 if uix > -2852\nl dec 533 if noj <= 2013\nuc dec 907 if f > 6\nq inc -741 if clj >= 1455\nq dec -603 if w > -763\nvv inc -546 if ino != -579\nnm inc 464 if mvh >= -3494\nnm dec -690 if ooh <= -868\nclj dec 569 if q != -213\nclj inc -642 if noj >= 2012\nino dec 374 if sp > -119\ngnz inc 988 if l < -733\nw dec -281 if ooh < -865\nt inc 795 if liq >= -405\nuc inc 245 if w <= -487\ncto dec -573 if mu != 2470\nliq dec -609 if hwv <= 488\njp dec 539 if sp >= -108\nq inc -366 if d > 2916\nmu inc -764 if sp <= -112\nuc inc 459 if d < 2932\nmvh dec 613 if ooh > -880\nooh dec 496 if sp != -113\nbt dec -461 if sp > -117\nmvh inc -359 if cto < -1122\nooh inc 942 if hwv >= 480\nooh inc -751 if mvh <= -4464\nnm inc -792 if mu <= 1702\nf dec 239 if mvh == -4468\nmvh inc 307 if noj != 2007\ncto dec -677 if nm > 5386\nd dec -22 if gnz <= 5852\nt dec 198 if gnz > 5850\nsp dec -431 if hwv < 483\ncto inc 421 if or < -1740\nl inc 768 if q >= -593\nliq dec -696 if sp >= 314\nsp dec 229 if cto < -24\nsp dec 207 if sp >= 81\nmu inc -753 if ooh >= -1178\nl inc -815 if cto > -33\nvv inc 236 if cto >= -26\nooh dec -899 if q != -588\nnm inc -62 if cto >= -32\nmu inc -717 if nm >= 5337\nliq dec 166 if ooh < -267\nor dec -343 if d == 2940\nly inc 367 if vv >= -4338\nino inc -783 if f < -232\nf dec 564 if noj > 2009\nliq inc 833 if clj >= 246\nsp inc 912 if l >= -797\ncto dec -353 if t < -1053\nmvh dec -8 if nm == 5330\nf inc 389 if sp > 783\nor inc 402 if clj >= 251\ncto dec -909 if mu != 947\nly inc -6 if w == -480\njp inc 895 if nm > 5324\nino inc -494 if nm <= 5337\nbt dec -29 if noj < 2008\nq inc 709 if mvh != -4153\nw dec 817 if vv > -4336\nnm inc 135 if sp >= 785\nuc dec -226 if ooh > -279\nl dec 785 if mu <= 956\nq dec -539 if f >= -407\nsp inc 397 if gnz == 5844\nvv inc -155 if bt == 4240\nclj inc -947 if sp >= 1184\ngnz dec -172 if liq < 1581\nclj inc -303 if mvh > -4160\nnm inc 928 if noj != 2016\nbt dec 112 if ino == -1450\nt inc -294 if cto == 1237\nhwv inc -683 if l != -1575\nuc dec -280 if hwv == 481\nbt inc 287 if or == -1346\nq dec 449 if f > -398\ngnz inc -362 if uix != -2838\nclj inc -711 if l == -1575\nclj dec 152 if liq != 1580\nclj inc 331 if mu > 960\nuc dec 752 if cto > 1234\nhwv inc -145 if gnz < 5662\nliq inc 291 if f >= -407\nooh inc 967 if q >= -56\nt inc -719 if ooh < 693\nooh inc 81 if jp > 1396\nw dec -927 if cto >= 1229\nw inc -706 if uix >= -2837\nor inc -973 if or < -1353\njp inc -185 if jp <= 1390\nuc dec 730 if q > -51\nmu dec -128 if bt != 4417\nliq inc -79 if bt != 4415\nbt inc -692 if liq < 1874\nw dec -959 if cto <= 1242\nt dec -403 if q == -48\nooh dec -113 if hwv != 347\nbt inc 671 if or > -1353\nhwv dec -751 if noj <= 2011\nd dec -958 if sp != 1198\njp dec 583 if bt != 4393\nl inc -923 if mvh < -4145\nly inc -23 if q == -48\ngnz dec -190 if gnz != 5649\nnm inc 391 if liq < 1867\nbt inc -848 if ly != -3294\nnoj dec 153 if jp != 622\nbt inc 424 if jp <= 627\nf inc -314 if clj >= -1861\ncto inc -229 if mvh <= -4151\nmvh inc 565 if vv <= -4490\nuc dec -221 if sp <= 1180\nvv dec -850 if gnz != 5848\nliq dec 938 if bt != 3971\nor inc -692 if ooh <= 812\njp inc 86 if mu > 1081\nliq inc 436 if l == -2498\nly dec -477 if w != 1406\nclj dec -730 if mvh <= -3582\nooh inc 442 if clj == -1130\nnoj inc -274 if nm >= 5851\nt dec -698 if uix < -2838\nly inc -306 if jp >= 708\nvv inc -616 if d <= 3909\nd dec -78 if l > -2499\nliq inc -324 if w == 1406\nor inc -341 if nm <= 5858\nor inc -360 if ly != -3613\nvv inc 712 if bt != 3976\nly dec 587 if l != -2501\nd dec -98 if l > -2494\nt dec 872 if bt >= 3980\nnm inc 111 if vv < -3538\nooh inc 806 if uix <= -2843\nor dec -123 if gnz > 5844\nclj dec 152 if clj > -1135\nsp dec 708 if bt >= 3964\nw inc 706 if t >= -976\nooh dec 827 if cto > 998\nw inc -347 if ino < -1443\nor inc -129 if noj < 1749\nor dec -801 if uix <= -2837\nooh inc 365 if nm != 5966\nnm dec 836 if vv < -3537\nsp dec -146 if mvh <= -3579\nuc dec 623 if gnz >= 5837\nq inc 419 if f == -719\ncto dec 668 if l >= -2507\nuix inc -645 if sp > 623\nuc inc -276 if bt <= 3970\ngnz dec -13 if w == 1765\ngnz inc 494 if d >= 3974\nclj dec 930 if ly > -4200\njp dec -755 if uc > -2648\nino inc 512 if sp == 627\nmvh inc 946 if hwv != 341\ngnz dec -351 if hwv < 339\nuix dec 72 if w > 1762\nclj dec -75 if f >= -723\nq inc -775 if mu != 1078\nor dec 462 if nm > 5135\nt dec -518 if hwv != 337\nliq dec 200 if noj >= 1745\nino inc -911 if d >= 3987\nnm dec -123 if mu == 1083\nnm dec 915 if ino == -942\ngnz inc -978 if mu < 1083\nclj inc -907 if ooh >= 1595\nnm inc -916 if bt >= 3969\nooh dec 526 if mu > 1076\nuc dec 332 if uix > -3566\ncto dec 994 if cto != 343\nw inc -438 if q > -411\nf dec 851 if mvh <= -2643\nq dec 221 if l < -2504\nclj dec -608 if f <= -714\nf dec -475 if jp > 1456\nq inc -668 if vv > -3540\nly inc 944 if cto >= -660\nliq dec -5 if jp >= 1459\nq dec 628 if uc < -2973\nuix inc 311 if l == -2498\nooh inc 956 if w < 1327\nclj inc -848 if bt != 3979\nuix dec -772 if gnz > 6698\nclj dec 929 if or < -2062\nd inc -590 if f <= -239\nd inc 392 if bt != 3962\nsp dec -991 if f >= -246\nf inc 367 if liq != 1052\nclj inc -262 if mu < 1079\nhwv inc -283 if ino == -938\nor inc -454 if mu <= 1083\nl dec 679 if mvh <= -2636\ngnz dec 796 if gnz != 6706\nsp inc -243 if sp < 1622\nor inc 18 if q <= -1038\ncto inc -384 if ino != -938\nuc inc -367 if ino != -940\nooh dec -948 if nm != 4342\nhwv dec -601 if q < -1024\nsp dec -455 if vv != -3536\nbt dec 644 if ly <= -3255\nooh dec -836 if ooh >= 2017\nino dec 181 if sp >= 1828\njp dec -89 if ooh == 2011\nmu dec 248 if bt == 3970\nclj inc 713 if sp < 1831\nuix inc -148 if l < -3173\nw dec -570 if jp != 1551\njp inc -297 if bt < 3977\ngnz inc -414 if t >= -973\nuc inc 569 if w >= 1890\nvv dec -776 if cto > -662\nly dec -904 if t == -974\nooh dec -425 if gnz <= 5914\nsp inc 740 if cto != -646\nw dec -53 if bt >= 3969\nmu dec -122 if d <= 3794\njp inc -552 if liq < 1039\nor dec -670 if cto < -646\nd inc -154 if q > -1026\njp dec 419 if vv <= -2766\nmu dec -340 if sp <= 2578\nuc dec -474 if bt != 3975\nuix inc -92 if uc <= -2298\ncto dec 651 if liq != 1037\nd dec 480 if d == 3785\nl inc -514 if vv > -2779\nf inc 876 if bt > 3966\nbt dec 20 if uc >= -2307\nf dec 219 if hwv <= 657\nly dec -128 if d <= 3311\nt inc -476 if sp < 2579\nino dec 641 if cto < -1313\nl inc 70 if l == -3691\nly inc -876 if liq != 1051\ncto inc 414 if clj >= -2588\nmvh dec 973 if jp > 833\nnm inc 452 if uc <= -2298\nuix dec 185 if hwv <= 662\nnm dec -740 if d >= 3301\ncto inc -292 if ly == -3091\nmvh inc -639 if q == -1032\nino inc -858 if q <= -1024\nino inc 268 if uc <= -2296\nmvh dec -117 if uix > -2912\nf inc 436 if mvh == -4142\nbt dec -330 if q <= -1025\nt dec 350 if ooh == 2428\nw inc 525 if vv == -2769\nooh dec 382 if uix == -2902\nbt inc 789 if noj >= 1741\njp dec 616 if mvh <= -4136\nliq inc 325 if q <= -1031\nclj inc -900 if t <= -1444\nq dec 943 if uix < -2900\nnm inc -808 if gnz > 5911\nhwv inc 253 if jp != 213\nmvh inc 584 if sp > 2562\nnoj inc -44 if t <= -1446\nuc dec 11 if ly != -3088\nl dec -712 if l <= -3622\nliq dec 11 if uc > -2318\nly inc -771 if w > 2484\nf dec 29 if l < -3620\ngnz inc -595 if ooh >= 2047\nnoj dec -566 if hwv <= 911\njp inc -161 if liq < 1361\nino inc -887 if uc > -2310\nd inc -642 if mvh <= -3548\nhwv inc -117 if ly <= -3082\nf dec -670 if hwv > 783\nvv dec 459 if ino >= -2590\nw dec -524 if vv != -2765\nnoj inc 465 if l != -3620\nor dec -177 if cto == -1596\njp inc 154 if f > 1418\nuix dec -101 if d != 2660\nly inc 566 if mu == 1297\nooh dec 83 if ly <= -2534\nnoj dec 735 if vv < -2774\nino dec 38 if t <= -1446\nnm dec -63 if uc > -2317\nhwv dec 838 if uc == -2309\nt dec 402 if mu < 1303\ncto dec -987 if ly < -2526\nhwv dec 140 if noj != 2723\nly inc 262 if vv != -2766\nmu dec 933 if ooh < 2056\nooh dec -304 if vv == -2769\nooh inc 669 if cto < -1595\nbt dec 456 if sp >= 2570\nmu dec -857 if mu >= 360\nmvh dec 288 if jp < 221\nd dec 575 if uc < -2305\nl dec -265 if cto > -1606\nnm inc -600 if liq > 1354\nhwv inc 707 if ooh <= 3030\nclj dec -560 if or == -1851\nclj dec -373 if bt > 4618\nvv dec -417 if mu >= 1219\nvv inc -274 if gnz > 5306\nuix dec 854 if cto != -1598\nnoj dec -179 if f != 1421\njp inc -806 if sp <= 2572\nf inc 424 if gnz != 5318\nhwv dec 53 if liq < 1351\nl dec 743 if bt < 4617\nsp dec -118 if q < -1974\nl inc -126 if f > 1854\nuix dec 938 if nm != 4997\nt inc -497 if l >= -4101\nf dec -516 if jp != -587\nq dec -464 if hwv > 519\nq inc -268 if l == -4099\nly inc 325 if or == -1851\nl inc 243 if mu < 1226\ncto dec 782 if t <= -2349\nw inc 59 if ly < -1929\njp dec 12 if cto > -2389\nl inc -367 if ly > -1932\nsp dec -136 if sp <= 2683\njp dec 682 if mvh != -3851\ncto dec -4 if cto >= -2385\nuc dec 160 if vv != -2630\nooh inc -788 if or >= -1849\nor inc 174 if mvh >= -3850\nclj dec 985 if vv >= -2627\nnm dec -552 if mu >= 1224\nuix inc -513 if w >= 3067\nly inc 218 if noj >= 2728\nuc inc -214 if ly > -1725\nl inc 861 if ly > -1730\ngnz inc -883 if t < -2344\nl dec 967 if cto != -2375\nf inc -449 if cto > -2384\nmvh dec 121 if ooh > 3026\nino inc 35 if ly == -1720\nino inc 194 if mvh < -3970\nl inc 336 if uix != -4594\nl dec 346 if or != -1670\nmvh dec -470 if t > -2351\nclj dec -209 if liq >= 1349\nuix dec -659 if jp >= -1289\nt dec 232 if or == -1674\nly dec -777 if ly < -1726\nq inc -492 if bt != 4622\nnm inc -323 if uc == -2683\nmu inc -959 if vv != -2626\ncto inc 943 if uc == -2683\njp dec -286 if bt < 4618\nf inc -909 if jp != -1002\nooh dec 547 if jp >= -1010\nt dec -508 if w != 3058\nbt inc -935 if w < 3068\njp dec 484 if mvh <= -3495\nf dec 608 if f != 1007\nor dec 392 if gnz > 4423\nuix dec -261 if hwv <= 520\nuix inc 958 if cto > -1438\nnm inc 723 if clj < -3715\nuix inc -970 if sp == 2688\ncto inc 485 if cto <= -1431\nl inc 96 if nm != 4669\nuix dec -928 if hwv <= 527\nnoj dec 605 if mu != 1229\nl dec 763 if ooh < 2486\nt inc -814 if nm <= 4674\ngnz inc -182 if t == -3163\nt dec 544 if hwv <= 525\ngnz dec 928 if uix == -2757\ncto inc 381 if mu < 1227\nbt inc -344 if bt >= 3669\nnm dec -833 if or != -2063\nclj inc 69 if hwv == 511\ncto inc 101 if uc <= -2674\ncto inc -914 if f >= 395\nbt dec 808 if q == -2271\nsp dec -420 if f < 397\nnm dec -401 if noj > 2129\njp dec 732 if vv == -2626\nw inc -62 if liq >= 1358\nuix inc 395 if gnz < 3327\ncto dec 512 if ino > -2607\nclj dec 546 if gnz > 3312\nnoj inc 505 if or > -2074\njp dec -391 if noj >= 2629\nliq dec -434 if q <= -2267\nly inc -900 if clj == -4255\nl dec -567 if clj > -4263\nmvh inc 506 if cto >= -1895\nd inc 363 if l >= -3095\nly inc -145 if ly >= -2624\nor dec 451 if ly >= -2770\nuc dec 705 if d < 2090\nw dec -574 if uix == -2362\nhwv inc 586 if cto > -1899\nuix dec 851 if clj >= -4264\nuix inc -531 if noj <= 2637\nhwv dec 523 if t >= -3714\nw dec 225 if bt > 2516\nnm dec -181 if ino <= -2597\nt dec 970 if sp != 3110\nq dec 369 if hwv <= 586\nw dec -92 if nm == 5684\nnoj inc -838 if uix != -3749\nor dec 381 if cto > -1894\nuix dec 930 if jp > -1348\nmvh dec -685 if f < 405\nclj inc 985 if bt < 2535\nq dec 203 if ino >= -2604\nmu dec 516 if hwv > 581\nl inc -372 if w == 3437\nw dec 804 if q != -2834\nd dec -276 if f <= 396\nvv dec -640 if or > -2910\nvv dec 613 if noj > 1789\nclj inc 304 if bt < 2529\nbt dec -800 if jp >= -1339\nuc dec -718 if l == -3477\nliq inc 589 if vv == -2599\nt inc 260 if gnz != 3324\nooh dec 313 if mu < 698\nliq dec 530 if q <= -2843\nt inc 460 if ly <= -2764\nly dec 155 if mu >= 710\njp inc 217 if ooh == 2480\nt dec -810 if uix < -4669\nooh dec 785 if clj != -2963\nl dec -700 if hwv > 579\nooh inc 609 if sp <= 3110\nuix inc -979 if cto == -1883\nl dec -996 if hwv == 583\nd dec -79 if f >= 388\nuix dec -379 if noj < 1800\nclj dec -385 if f <= 401\nino dec 669 if uc >= -2679\nhwv inc -238 if q < -2844\nt inc 449 if mu > 701\nbt dec 538 if ino < -3262\nw dec 615 if hwv == 583\nliq inc 845 if bt > 1986\nnm dec -165 if ooh == 2304\nt inc -927 if t < -2695\nmvh dec 416 if noj == 1791\ngnz dec -441 if vv > -2603\nw dec 438 if hwv < 575\nt inc 585 if nm >= 5842\nuix inc 919 if noj > 1785\nclj inc -411 if liq < 2695\nor inc 157 if clj >= -2589\nvv inc -878 if cto <= -1896\nor inc 190 if gnz > 3765\nl dec 367 if uix >= -3376\n"

input :: Instructions
input = map words $ lines inputString

-- |Finds a value of register in a list of values, 0 if it's not there
getVal :: Name -> Values -> Int
getVal name val = fromMaybe 0 $ lookup name val

-- |Parses an instruction
parseLine :: Instruction -> Values -> Parsed
parseLine line val = (head line, 
                     (if line!!1 == "dec" then -1 else 1)  * (read $ line!!2),
                     getBool line val)

-- |From instruction and register values evaluates the boolean condition
getBool :: Instruction -> Values -> Bool
getBool line val = getFunction (line!!5) 
                   (if all (\x -> isNumber x || x == '-') first then read first else getVal first val)
                   (if all (\x -> isNumber x || x == '-') second then read second else getVal second val)
                       where first = line!!4
                             second = line!!6

-- |Returns a desired boolean function
getFunction :: String -> (Int -> Int -> Bool)
getFunction ">" = (>)
getFunction "<" = (<)
getFunction "==" = (==)
getFunction ">=" = (>=)
getFunction "<=" = (<=)
getFunction "!=" = (/=)

-- |Returns values of all registers
processInstructions :: Values
processInstructions = run (input) []

-- |Processes instructions
run :: Instructions -> Values -> Values
run [] val = val
run (line:xs) val = run xs ((\(var,inc,con) -> 
                              if con 
                              then (var,getVal var val + inc) : removeFromValues var val 
                              else val) $ parseLine line val)

-- |When adding value, checks whether it's already there and deletes it
removeFromValues :: String -> Values -> Values
removeFromValues _ [] = []
removeFromValues var ((x,i):xs) = if var == x then xs else (x,i):removeFromValues var xs

-- |Returns maximal value of processed register values
getMax :: Values -> Int
getMax val = maximum $ map snd val

result1 :: Int
result1 = getMax processInstructions

-- |Returns values of all registers - part 2 version - keeping history
processInstructions2 :: Values
processInstructions2 = run2 (input) []

-- |Processes instructions - part 2 version - keeping history
run2 :: Instructions -> Values -> Values
run2 [] val = val
run2 (line:xs) val = run2 xs ((\(var,inc,con) -> 
                              if con 
                              then (var,getVal var val + inc) : val 
                              else val) $ parseLine line val)

result2 :: Int
result2 = getMax processInstructions2