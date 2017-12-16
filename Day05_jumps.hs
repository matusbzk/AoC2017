module Day05_jumps (result1, result2) where

import Data.List

inputString :: String
inputString = "1\n0\n0\n1\n0\n-3\n-3\n-6\n0\n-7\n-9\n0\n-2\n0\n-8\n-1\n-15\n-15\n-4\n-12\n-19\n-3\n-12\n-10\n-3\n-17\n-17\n-9\n-18\n-20\n-1\n-6\n-29\n-18\n-5\n-25\n-13\n-22\n-33\n2\n-39\n-40\n-33\n-33\n-27\n-7\n-44\n1\n-20\n-46\n-41\n0\n-19\n0\n-10\n-15\n-21\n-17\n-52\n-20\n-45\n-34\n-30\n-29\n-40\n-1\n-18\n-10\n-19\n-15\n-64\n-61\n-53\n-28\n-45\n-12\n-73\n-36\n-36\n-2\n-30\n-56\n-63\n-42\n-8\n-35\n-32\n-39\n-22\n-87\n-45\n-35\n-74\n1\n-5\n-45\n-16\n-19\n-48\n-25\n-94\n-85\n-75\n-15\n-79\n-37\n-82\n-13\n-85\n-20\n-52\n-50\n-85\n-13\n-70\n-16\n-86\n0\n-68\n-55\n-15\n-25\n-31\n-117\n-91\n-67\n-114\n-108\n-50\n-76\n-116\n-12\n-27\n-98\n-115\n-101\n-124\n-2\n-4\n-95\n-41\n-35\n-110\n-86\n-4\n-126\n-67\n-94\n-81\n-101\n-93\n-109\n-71\n-152\n-110\n-145\n-28\n-139\n-106\n-83\n-58\n-100\n-1\n-21\n-112\n-130\n-102\n-34\n-80\n-49\n-11\n-72\n-82\n-132\n-36\n-119\n-127\n-85\n-66\n-12\n-43\n-3\n-86\n-116\n-125\n-162\n0\n-185\n-39\n-27\n-159\n-23\n-71\n-50\n-119\n-183\n-56\n-48\n-113\n-197\n-199\n-6\n-92\n-7\n-39\n-63\n-67\n-22\n-126\n-170\n-67\n-59\n-114\n-207\n-13\n-15\n-168\n-167\n-15\n-143\n-128\n-136\n-115\n2\n-113\n-74\n-104\n-91\n-157\n-121\n-126\n-125\n-112\n-106\n-194\n-146\n-165\n-139\n-97\n-134\n-133\n-165\n-237\n-69\n-10\n-232\n-100\n-168\n-53\n-83\n-149\n-42\n-71\n-119\n-185\n-110\n-92\n-256\n-19\n-249\n-147\n-68\n-205\n-52\n-212\n-5\n-167\n-63\n-264\n-176\n-180\n-223\n-15\n-158\n-2\n-134\n-268\n-92\n-193\n-145\n-141\n-218\n-99\n-85\n-213\n-24\n-82\n-201\n-109\n0\n-152\n-14\n-168\n-103\n-232\n-7\n-115\n-141\n-273\n-117\n-201\n-165\n-265\n-81\n-64\n-243\n-123\n0\n-24\n-140\n-235\n-194\n-11\n-129\n-128\n-211\n-59\n-97\n-40\n-76\n-104\n-38\n-312\n-225\n-93\n-113\n-108\n-109\n-22\n-128\n-250\n-222\n-262\n-214\n-34\n-87\n-176\n-166\n-33\n-226\n-198\n-238\n-159\n-295\n-245\n-227\n-211\n-59\n-237\n-74\n-92\n-221\n-118\n-77\n-160\n-110\n-260\n-259\n-25\n-117\n-120\n-304\n-273\n-89\n-354\n-85\n-339\n-366\n-46\n-91\n-280\n-68\n-62\n-118\n-178\n-249\n-281\n-273\n-360\n-356\n-150\n-367\n-47\n-289\n-51\n-233\n-158\n-226\n-372\n-212\n-139\n-119\n-238\n-244\n-39\n-263\n-239\n-374\n-257\n-146\n-347\n-209\n-350\n2\n-403\n-149\n-381\n-55\n-114\n-294\n-106\n-118\n-222\n-24\n-259\n-301\n-357\n-13\n-137\n-281\n-88\n-7\n-276\n2\n-7\n-232\n-337\n-172\n-181\n-129\n-51\n-147\n-310\n-253\n-396\n-111\n-386\n-106\n-240\n-432\n-94\n-239\n-334\n-135\n-196\n-329\n-228\n-10\n-438\n-419\n-86\n-167\n-56\n-200\n-69\n-229\n-90\n-147\n-160\n-345\n-7\n-96\n-251\n-113\n-53\n-186\n-426\n-244\n-185\n-178\n-267\n-378\n-368\n-53\n-424\n-178\n-179\n-353\n-242\n-182\n-423\n-139\n-49\n-335\n-225\n-3\n-13\n-159\n-245\n-244\n-359\n-223\n-380\n-264\n-383\n-285\n-322\n-471\n-7\n-295\n-84\n-291\n-92\n-129\n-175\n-205\n-49\n-164\n-262\n-105\n-364\n-438\n-283\n-415\n-323\n-167\n-501\n-22\n-428\n-10\n-156\n-517\n-385\n-356\n-396\n-295\n-372\n-409\n-311\n-261\n-262\n-4\n-41\n-264\n-436\n-316\n-22\n-449\n-444\n-306\n-324\n-16\n-431\n-379\n-476\n-369\n-198\n-312\n-393\n-47\n-277\n-523\n-402\n-368\n-312\n-418\n-21\n-372\n-86\n-286\n-475\n-183\n-405\n-427\n-404\n-405\n-446\n-549\n-296\n-249\n-243\n-472\n-450\n-126\n-260\n-227\n-25\n-348\n-122\n-80\n-330\n-222\n-389\n-360\n-250\n-310\n-544\n-113\n-556\n-445\n-457\n-533\n-447\n-251\n-373\n-343\n-391\n-12\n-567\n-128\n-332\n-245\n-252\n-517\n-101\n-480\n-401\n-290\n-394\n-321\n-533\n-257\n-102\n-152\n-251\n-102\n-507\n-597\n-175\n-345\n-442\n-600\n-306\n-149\n-151\n-355\n-71\n-315\n-35\n-161\n-404\n-253\n-526\n-275\n-339\n-483\n-315\n-423\n-116\n-345\n-507\n-332\n-27\n-395\n-634\n-548\n-205\n-276\n-213\n-356\n-413\n-353\n-89\n-88\n-649\n-465\n-580\n-286\n-607\n-21\n-35\n-227\n-415\n-501\n-343\n-245\n-94\n-200\n-376\n-43\n-585\n-668\n-623\n-264\n-574\n-223\n-628\n-556\n-100\n-53\n-88\n-644\n-285\n-631\n-418\n-369\n-477\n-379\n-199\n-68\n-323\n-337\n-318\n-651\n-255\n-323\n-38\n-502\n-356\n-550\n-555\n-679\n-170\n-38\n-516\n-367\n-687\n-52\n-23\n-225\n-451\n-323\n-637\n-264\n0\n-535\n-67\n-254\n-580\n-173\n-301\n-374\n-120\n-8\n-197\n-154\n-173\n-597\n-525\n-341\n-278\n-721\n-360\n-728\n-607\n-346\n-491\n-247\n2\n-121\n-505\n-694\n-706\n-297\n-4\n-110\n-187\n-259\n-414\n-323\n-637\n-96\n-157\n-331\n-521\n-590\n-390\n-220\n-100\n-156\n-302\n-545\n-322\n-450\n-236\n-287\n-605\n-346\n-467\n-25\n-382\n-430\n-682\n2\n-261\n-605\n-635\n-633\n-553\n-491\n-226\n-622\n-191\n-48\n-92\n-218\n-548\n-651\n-672\n-631\n-764\n-367\n-108\n-507\n-790\n-573\n-282\n-334\n-280\n-285\n-105\n-797\n-228\n-85\n-102\n-623\n-304\n-52\n-278\n-243\n-681\n-133\n-606\n-345\n-354\n-402\n-6\n-353\n-447\n-69\n-432\n-54\n-486\n-78\n-774\n-241\n-625\n-806\n-425\n-790\n-381\n-507\n-755\n-304\n-362\n-606\n-256\n-25\n-341\n-451\n-12\n-606\n-738\n-484\n-167\n-663\n1\n-481\n-788\n-469\n-388\n-59\n-105\n-402\n-523\n-717\n-234\n-611\n-543\n-435\n-383\n-267\n-217\n-275\n-610\n-335\n-411\n-842\n-131\n-460\n-527\n-511\n-761\n-160\n-660\n-605\n-817\n-546\n-286\n-604\n-204\n-223\n-558\n-652\n-542\n-350\n-527\n-59\n-782\n-764\n-529\n-608\n-688\n-301\n-715\n-148\n-492\n-796\n-285\n-491\n-702\n-767\n-191\n-572\n-712\n-207\n-589\n-39\n-278\n-485\n-273\n-51\n-560\n-718\n-790\n0\n-194\n-319\n-171\n-552\n-247\n-810\n-737\n-677\n-853\n-806\n-565\n-923\n-427\n-442\n-375\n-215\n-706\n-139\n-396\n-126\n-170\n-281\n-544\n-101\n-271\n-728\n-485\n-677\n-442\n-137\n-78\n-414\n-546\n-669\n-609\n-284\n-488\n-181\n-534\n-946\n-191\n-255\n-413\n-614\n-329\n-932\n-528\n-689\n-246\n-272\n-395\n-211\n-702\n-786\n-595\n-835\n-870\n-822\n-507\n-533\n-147\n-141\n-385\n-623\n-745\n-575\n-225\n-79\n-736\n-887\n-649\n-133\n-500\n-422\n-810\n-491\n-480\n-462\n-16\n-848\n-740\n-809\n-9\n-399\n-535\n-274\n-165\n-119\n-77\n-340\n-597\n-755\n-611\n-929\n-50\n-745\n-530\n-392\n-77\n-760\n-961\n-28\n-507\n-21\n-253\n-846\n-996\n-308\n-175\n-684\n-315\n-859\n-757\n-418\n-591\n-946\n-393\n-25\n-917\n-208\n-572\n"

-- |Input as a list of ints
input :: [Int]
input = map read . lines $ inputString

-- |Stores current position and a list of instructions
type State = (Int, [Int])

-- |From what state do I begin
startState :: State
startState = (0,input)

-- |Checks whether given state is valid (returns false if program reached the exit)
validState :: State -> Bool
validState (pos,jumps) = pos >= 0 && pos < length jumps

-- |Takes a state and performs one instruction
makeJump :: State -> State
makeJump (position, jumps) = (position + dif, newJumps)
            where dif = jumps !! position
                  newJumps = take position jumps ++ (dif+1) : drop (position + 1) jumps

-- |How many steps does it take to reach the exit - result to part 1
-- |Not very effective, takes me like 6 seconds
stepsUntilExit :: Int
stepsUntilExit = fst $ stepsUntilExit' (0,startState)

-- |Iterates a makeJump function, with checking if state is valid
stepsUntilExit' :: (Int, State) -> (Int, State)
stepsUntilExit' (n,state) = if validState state then stepsUntilExit' (n+1, makeJump state) 
                                                else (n,state)

result1 :: Int
result1 = stepsUntilExit

-- |Takes a state and performs one instruction - version for part 2
makeJump2 :: State -> State
makeJump2 (position, jumps) = (position + dif, newJumps)
            where dif = jumps !! position
                  newDif = if dif >= 3 then dif - 1 else dif + 1 
                  newJumps = take position jumps ++ [newDif] ++ drop (position + 1) jumps

-- |How many steps does it take to reach the exit - result to part 2
-- |Actually inefficient af, I have calculated the result in C#
-- |Takes more than 10 minutes
stepsUntilExit2 :: Int
stepsUntilExit2 = fst $ stepsUntilExit2' (0,startState)

-- |Iterates a makeJump2 function, with checking if state is valid
stepsUntilExit2' :: (Int, State) -> (Int, State)
stepsUntilExit2' (n,state) = if validState state then stepsUntilExit2' (n+1, makeJump2 state) 
                                                 else (n,state)

result2 :: Int
result2 = stepsUntilExit2
