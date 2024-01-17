# @leetup=custom
# @leetup=info id=1712 lang=ruby slug=ways-to-split-array-into-three-subarrays

# A split of an integer array is good if:
# 
# * The array is split into three non-empty contiguous subarrays - named
#   `left`, `mid`, `right` respectively from left to right.
# * The sum of the elements in `left` is less than or equal to the sum of the
#   elements in `mid`, and the sum of the elements in `mid` is less than or equal
#   to the sum of the elements in `right`.
# 
# Given `nums`, an array of non-negative integers, return *the number of
# good ways to split* `nums`. As the number may be too large, return it
# modulo `109 + 7`.
# 
# Example 1:
# Input: nums = [1,1,1]
# Output: 1
# Explanation: The only good way to split nums is [1] [1] [1].
# 
# Example 2:
# Input: nums = [1,2,2,2,5,0]
# Output: 3
# Explanation: There are three good ways of splitting nums:
# [1] [2] [2,2,5,0]
# [1] [2,2] [2,5,0]
# [1,2] [2,2] [5,0]
# 
# Example 3:
# Input: nums = [3,2,1]
# Output: 0
# Explanation: There is no good way to split nums.
# 
# Constraints:
# * `3 <= nums.length <= 105`
# * `0 <= nums[i] <= 104`

# @leetup=custom
# @leetup=code

# @param {Integer[]} nums
# @return {Integer}
def ways_to_split(nums)
  sums = Array.new(nums.size)
  sums[0] = nums[0]
  (1...sums.size).each { |i| sums[i] = sums[i - 1] + nums[i] }

  count = 0
  (0...nums.size).each do |i|
    left = sums[i]
    min_j = ((i+1)...nums.size).bsearch do |j|
      mid = sums[j] - sums[i]
      left <= mid
    end
    next if min_j.nil?

    max_j = (min_j...nums.size).bsearch do |j|
      mid = sums[j] - sums[i]
      right = sums.last - sums[j]
      left > mid || mid > right
    end
    max_j ||= nums.size - 1
    
    count += (max_j - min_j)
  end
  count % 1_000_000_007
end 
# @leetup=code
# @leetup=custom
ways_to_split([0, 3, 3]) => 1
ways_to_split(
  [1095,5313,6333,4851,5244,4548,425,184,9601,7991,8534,3436,4442,3855,3311,9308,5965,2268,9678,2393,1401,4438,7238,2711,5193,2505,4523,2649,7849,6782,8325,7301,3951,7904,6421,2286,7075,9478,8306,7854,797,5639,7617,7459,7477,6161,1747,5262,6306,5934,6011,2078,1774,3692,8025,3096,3432,66,4318,5993,6367,12,9378,3944,1552,8858,1714,2417,4405,5297,6870,9933,986,1747,7013,268,1758,8998,1751,3231,7897,425,9793,6475,4039,3485,5082,3144,8328,4570,3568,2930,9106,8315,8596,1226,1538,412,3135,4518,4845,5679,8014,1244,4974,9181,8755,107,9702,6488,4033,3546,5661,8876,4893,1327,6806,6087,9604,3155,3836,1788,568,652,7836,1613,1258,4398,1287,4034,1929,6511,3962,3103,1972,8788,6805,9790,3583,4114,1926,3066,7306,575,2956,9489,1479,9313,4540,3092,9011,7508,8356,4836,1181,3119,6407,6295,4945,783,3714,7945,9417,9023,8755,7922,6689,5201,3163,2325,1764,7302,7624,2376,2929,7582,1643,240,1337,1957,8282,4836,3906,5880,6052,1083,2518,5061,2476,7262,7190,4672,7870,3834,8640,9646,1299,7318,6983,5935,4778,1731,8946,6368,4687,1585,7408,9920,7028,3417,7544,3299,1085,1493,513,7970,2741,722,4744,104,547,9022,7446,8283,5081,2090,774,3136,1467,9836,7953,860,649,502,4014,2751,8011,3855,1545,7750,768,3779,189,4784,109,9552,1429,6871,7499,6128,6437,141,8073,7132,1734,4887,1075,782,5537,1628,9570,2829,9336,8923,7120,9752,9821,5156,8696,5605,9001,5284,92,2975,7149,7836,506,2250,7679,4572,5943,2213,3431,1553,9932,6966,514,7036,678,6675,5116,670,3652,6967,76,8436,1610,3436,6580,4472,9935,5284,9550,2608,5389,4941,1894,3152,3208,3140,9502,8659,1987,3619,7611,4723,6976,314,1376,6039,4466,3568,3165,6365,5456,7873,1564,5274,4235,1591,6738,9159,7506,7051,7242,6869,723,7887,9219,568,5775,861,2499,899,6550,5844,936,3433,8002,4285,6963,2382,9826,9048,8080,4901,9258,3658,3818,8324,4420,1243,4954,2882,9223,9945,3994,5656,4244,8929,1846,6623,9493,6192,3713,4400,9178,3672,256,2884,7093,9961,2237,2615,7310,8884,2170,1739,1802,7293,9821,1891,7926,7537,5770,2536,8093,3238,1749,3545,2030,8833,5134,3738,1171,4096,9483,8693,3531,6810,7509,4024,817,5986,1859,5901,3235,9942,8331,7508,2643,7081,2973,9025,6967,256,8035,7737,5948,9,2192,8715,8914,8577,6215,4952,5039,7471,8185,3231,7648,6208,7681,5894,2074,3711,3285,2866,9529,3230,709,3027,1297,7791,2238,3011,3763,2210,7035,2620,5411,3020,2047,8669,2994,3078,5410,822,8864,7733,9291,6778,8558,9161,2908,3473,437,3911,5834,946,4531,6020,4809,9606,742,9017,7207,3602,9212,2136,4547,4555,8898,359,3861,9773,7349,8437,1072,2998,5153,5287,197,1447,5105,1346,6647,9051,4549,7347,8321,5078,1207,939,8810,621,6027,1742,6962,8920,9043,8774,3809,8904,840,7294,1226,1863,5501,3208,1921,8186,8124,8786,2877,3019,5191,5382,359,4355,7647,2406,4684,4675,4160,8872,5771,1078,6787,692,4833,3594,1602,8611,2985,384,8511,3202,6352,4957,9702,9560,1397,4249,7757,3077,5844,9779,6100,9735,8315,901,237,6285,7665,3983,5082,3153,4554,7638,3145,9308,4179,444,4578,3090,2247,8966,3159,9533,7544,5779,1973,12,7520,6816,8163,7930,3088,6513,6674,7168,3110,5940,4765,1652,5910,609,2777,3217,1675,1185,8951,4082,6576,1741,4404,4360,9331,4353,6561,4002,4497,9146,7910,1284,361,8120,213,8461,8888,6563,7594,5758,4492,9155,3846,9399,7182,8109,8507,2237,3286,9892,2037,8663,1627,8243,2725,9231,8056,1866,1339,3341,5717,8042,6726,2684,3406,5692,2989,7434,6246,186,3591,8656,9654,2142,1361,7281,9717,8583,7927,5993,6794,6745,354,2775,6404,5693,9588,918,5050,6906,689,8061,9558,6742,2159,9517,3467,3559,2471,592,2038,5885,6329,6680,7980,1105,2061,7182,6099,1219,7315,2580,582,7282,8336,6412,5719,3399,531,5569,9878,5500,8488,4551,7163,386,4683,3186,8095,2915,4874,2943,5056,1532,1422,9177,5271,9261,6162,6970,1209,7031,8804,5466,4992,2429,1356,3,9763,7550,3758,7606,8315,9512,9194,6856,5400,5426,4361,5952,3768,7234,3932,9876,1061,8542,9511,4467,8264,926,1552,6982,7220,4300,8609,1965,5719,5248,5828,5624,3543,998,859,9755,8368,5144,9222,7500,3424,5088,4831,7052,2072,2300,3493,697,7487,2452,3345,5556,7433,6357,1696,5601,3595,6368,4665,345,1594,2064,127,8873,156,5438,643,656,4741,3686,6264,9916,7040,5297,4190,1734,451,4927,1865,8576,8362,3155,8415,5395,5345,6681,1929,1489,5229,3081,5368,7300,3404,8236,161,741,3124,8976,333,4383,970,3435,1231,6714,4676,2404,8120,9804,4526,9061,937,2214,4263,1323,4038,5330,9166,6758,8708,4373,660,314,331,8951,3919,1569,4085,9777,7689,8736,8188,7512,914,9764,4122,7266,8175,4819,6063,7553,1823,2086,5164,9267,3695,360,7786,3268,3743,5855,2755,5853,9599,2631,3604,9429,3791,2457,3564,3865,7091,5294,5948,4519,279,9651,628,960,4929,9234,7383,2554,9542,8752,8180,7180,8996,4620,4811,1376,2419,1672,2468,7977,6365,393,792,9577,2255,3967,6040,9828,4438,3454,9808,9039,2853,8643,1325,2232,3029,1559,3094,87,3685,1604,2868,8039,3513,6171,1647,1872,7708,7185,9091,847,8098,778,2735,2852,2984,2409,3531,1286,2739,5861,9947,3604,734,2782,6654,7959,537,1783,5172,2047,6243,3006,9011,8859,9028,141,5451,1994,4418,3533,8308,543,6232,9800,6905,2557,1420,3728,5518,5778,2774,9965,6457,1723,6352,8619,91,6182,2613,3275,1564,3997,6734,2215,5203,1379,1638,2088,832,4589,5373,2124,1940,5546,2253,1239,6845,3052,4321,752,8737,4009,2296,3215,8875,5327,652,6303,9252,4269,3941,8159,7650,562,2561,6721,5280,8703,8697,8945,1642,6655,7246,4706,7427,9119,8552,9008,1155,1016,4242,648,7458,220,7422,5384,7410,6768,3485,2530,4033,4458,8709,9292,5441,5862,6401,3207,9703,5422,6774,6708,6556,428,436,2678,8684,7968,3534,2907,9853,4416,1603,6499,8139,4955,1811,5448,7908,7481,115,6454,3614,2294,8126,69,3212,2208,9027,1553,7184,4203,4592,3926,3009,3754,3348,1266,6409,3747,1699,6159,6971,9628,2026,1705,4864,5050,2573,1436,1706,2487,8149,3617,2709,289,9460,6473,9395,9765,9868,3905,4569,8609,1818,1394,4933,5940,8139,272,2326,7964,8420,4268,4692,403,9291,6650,5204,4174,1617,5734,9532,4205,8451,7860,6778,446,5449,9061,618,5105,3936,8353,4673,8157,8667,5090,6218,5199,6606,1090,9829,6311,7528,1794,8297,772,8763,1585,9851,3763,1013,7567,3708,3850,6974,2733,4721,9311,143,9985,8434,4912,5204,2180,8638,7428,4659,2034,6481,41,6850,415,6207,6021,3977,548,8035,3891,8682,1839,9308,2548,5498,8715,5691,8766,3612,2078,8969,4613,4220,3251,1748,8870,2442,5545,3518,627,372,6988,841,8664,5689,2589,2874,9532,4632,4316,9579,4800,5694,3132,4986,5344,2253,3911,6904,1843,2753,6868,2508,4375,6798,7421,1004,3282,1863,4484,7200,6726,223,7928,7575,7584,5182,2541,7027,531,8451,9352,9133,8713,8304,6767,7712,6973,1808,1086,9931,8042,6317,5782,9861,2528,3874,9114,3292,6058,7243,8915,4204,2197,4992,9782,1005,1592,1952,5678,346,9040,9073,8656,1287,8834,3143,1552,9335,2357,7867,6333,8915,3780,384,4482,5206,6312,5383,9262,8781,6272,3570,6704,4373,926,7445,8239,5627,8453,5636,9874,9139,1584,4779,6140,8886,6779,1696,525,2379,4259,6581,680,3638,6731,1593,1766,45,5673,3541,5425,2377,4118,8709,2152,5007,4176,7428,8691,2742,4578,6335,5222,3857,8059,7212,9575,8758,809,6901,7542,5320,4978,2302,9339,8335,1472,3152,6715,3220,7630,7824,6377,6913,3074,8737,7239,3718,9281,3741,8508,5477,7545,8096,5036,6211,723,2214,9487,2530,294,3119,8889,7250,8035,3813,5058,578,7828,2505,7991,9581,1194,7406,1108,6428,639,1341,6117,6990,1002,1920,8620,3319,1694,2922,9816,3930,9875,8000,7490,580,2236,4262,6988,8590,9239,1732,7026,9109,3191,9812,7111,5983,7866,3206,2734,7809,8763,2083,20,2212,2834,1050,8027,9861,4977,235,197,1697,3871,9161,8873,5459,330,9772,7327,925,6056,7769,984,639,714,3681,8097,2828,5224,2165,658,2787,9296,1340,4128,1970,1899,1544,2712,9572,4703,6537,4580,4879,2706,7132,3179,1595,5982,2459,7242,6195,7718,3559,6747,6384,8427,3454,8293,1088,3155,8297,8211,1073,7897,3621,4891,4098,4049,2099,2649,470,7882,8175,7779,3876,1906,7623,7625,7540,1565,4113,5785,8009,8367,5045,7307,1478,4498,8924,5125,1265,1306,4831,4405,7799,7314,6022,8284,6803,1295,8527,3731,1416,5709,4430,7974,6299,4750,8429,3335,5100,2647,1814,6768,5523,6114,3400,2174,9440,9592,1174,2382,151,4709,7323,1495,6066,1193,3731,7190,3243,6229,5534,7151,5145,9690,2643,3395,5591,4287,5234,4961,5030,3354,2266,1382,1359,2398,3679,7671,3285,8459,860,1778,5677,5641,9336,7105,2281,8371,2364,745,3234,7267,6642,6733,6856,2661,2026,2976,9335,2677,1121,7222,1217,3715,9170,2244,9786,9141,6971,3786,1384,6110,341,1117,6897,3265,8205,3506,7231,3004,7491,6815,3195,9266,5875,4375,8139,4746,5831,807,9444,9446,8092,8561,7829,8784,7256,6230,7899,1865,277,7944,9537,4012,3917,6004,4114,8096,5068,2881,7998,2637,4240,5622,3640,8485,5026,2004,7290,8330,2676,9930,2546,147,6380,8069,8754,636,2293,625,3489,3810,4119,6929,8482,4688,7930,446,3244,501,227,6305,8041,4190,1614,9231,8536,5195,6832,8482,3802,815,9019,5970,4434,9738,6381,9713,9909,1969,2583,2607,8075,6879,6043,9174,8155,8105,7801,4539,6168,4690,733,2679,8369,5872,1863,2832,287,9991,1071,2220,9681,1701,1918,653,3511,8731,1588,8057,218,6803,3999,3477,1025,1931,4015,6586,6059,5759,8043,4300,9814,4324,6663,4366,276,7953,3556,9376,6902,4192,7120,6350,8901,4098,3378,6710,1169,871,3365,5370,6746,4211,6689,3842,7771,2149,5674,686,5302,2246,9243,2364,561,9443,3057,1731,3822,4671,4433,3460,2865,400,4775,1426,922,9341,2930,1721,1101,3781,6143,5411,8352,8389,8285,1810,1543,4880,7671,2782,7812,4735,8915,3754,8818,5078,3741,1642,6858,6023,9450,9779,6441,7825,7504,2741,7894,7108,3599,5254,9516,9654,211,5825,9663,1551,3434,7127,4616,4735,1594,4437,6656,9492,2765,1154,1708,7645,9245,9691,3291,1815,6542,5774,5682,7255,6861,144,9639,9375,3091,9107,2759,8319,4230,502,4886,8267,200,2075,7175,1922,8258,3016,5593,7858,1058,5959,2364,5236,717,6923,8054,4535,7830,9950,553,344,3473,1441,7290,9389,3689,8916,2568,9744,9893,8961,1576,8465,5974,8709,3013,4564,4322,5400,8688,5781,996,8804,549,8968,6164,7901,4569,1557,8886,2503,4082,8328,6462,6519,2867,5765,388,9220,3107,2505,2577,1526,1005,1448,9630,4994,1087,4993,1981,185,947,4050,2650,746,3241,7358,6561,1152,9869,1114,6598,2263,9144,7781,7020,573,7354,1581,1946,8861,873,6074,1699,36,646,3688,327,9758,564,8279,9161,6738,5479,7811,7215,3406,3311,2478,5897,8067,943,4400,1115,242,9254,3071,9161,2287,6599,5708,3712,9190,7060,992,2790,818,6792,4760,5781,8389,1722,7159,513,594,5265,1196,5106,4241,5243,4026,7184,5146,4383,1447,1706,5261,8736,3428,7102,6505,8760,6797,7550,8689,6835,8263,5689,5337,3960,3725,2566,0,9521,4901,1519,904,1797,7098,6311,9587,2329,153,8589,6996,4557,4218,1805,9574,5993,9442,7282,1345,7903,1501,5213,432,3468,6556,2101,3173,6326,6497,6327,1533,1056,8731,8779,1546,8306,9723,3806,1402,7382,416,7681,7698,9176,8538,6691,1590,4498,2185,1129,8242,8345,8663,7171,4122,5989,6355,8536,5591,408,6004,8585,4452,8304,1813,8710,4362,7722,9384,5959,5761,5393,5130,8116,9893,321,3347,449,5756,2872,3420,1927,5196,1919,5583,7273,284,7224,9243,6213,4890,9429,998,1070,9942,391,1413,6368,2823,1542,3463,7275,4390,3931,2753,7078,1072,5166,8006,775,7041,3727,5764,8313,987,8754,7109,5220,1707,7905,2166,6368,1942,9864,5456,81,4937,8322,9985,4164,8837,8865,8475,8676,4251,5897,5799,3901,6460,7644,847,4226,6789,3560,9303,56,1278,4124,6232,3336,5004,9909,3244,3882,7857,3974,6612,6342,637,6360,8793,4109,2105,630,7637,4765,5377,5369,3452,7855,8578,7184,4019,5960,7555,6449,2257,1001,6382,9601,5372,6931,9928,6520,1494,8011,7900,4137,3953,8392,2347,9003,5695,6348,7204,734,9721,2805,5155,2011,9771,1781,1872,3726,8527,7618,7850,1150,9597,5028,7382,9702,531,4484,1698,5482,7342,4896,3507,221,9419,380,5050,5149,2801,5936,1972,3343,6782,6854,9692,8485,3967,7386,6474,8801,4913,2272,7726,4530,7240,6385,9426,670,8844,8950,9746,3529,6489,4532,1370,873,9501,2277,9817,9031,4332,223,1078,6413,5958,7215,9181,2857,7697,4377,7792,9608,803,1121,5911,6411,4334,7157,5955,9159,7798,6701,5347,7040,4195,4221,8845,1217,6935,1615,6453,2915,6098,5691,94,615,5597,503,7528,9509,8681,7236,875,1014,5949,8260,7318,9883,8972,2879,1075,152,7005,2005,7701,83,6864,201,9512,719,5875,1020,7019,393,3097,3730,1210,7811,7448,8747,8445,6942,5639,3795,4309,7816,9940,7124,3765,5938,3996,4979,6090,4107,4523,1559,6251,6931,523,6356,1712,7952,9096,3011,8201,6024,3655,4911,5574,5882,1515,5971,2158,3418,6621,6457,9261,245,2864,5788,1757,3173,9319,9939,3557,1752,5350,7236,8346,7605,3651,6272,7576,2738,543,2601,8934,5122,1194,371,8092,7784,8821,6551,1830,4857,5580,2276,388,7368,2746,774,1375,9613,1972,5684,9881,3616,5347,3326,460,629,3661,418,4472,3277,653,2871,6621,9624,431,903,6720,2766,7596,7359,6439,4221,8936,110,7983,3724,9470,4455,2158,1920,7553,9778,9681,5528,5518,904,8994,603,277,3777,8435,1075,3628,8759,9538,771,8628,5985,4059,4980,7714,5773,644,6540,2622,1431,121,2855,927,1958,4068,9979,1025,9798,5528,4999,3939,4149,1582,7,4855,8078,3136,723,2850,414,5372,9919,311,4058,4648,6516,4748,6783,2465,2501,8378,752,4789,355,3908,3325,2664,5660,148,4074,8857,661,5042,1312,5326,7954,9251,462,5269,5074,9147,7789,1901,4025,6537,8567,2546,7293,4230,2727,1143,1321,2862,4863,5182,9667,2876,2001,350,3715,5664,9207,8673,9362,6782,907,3286,2998,8361,9034,602,5749,1303,5585,7151,8028,5288,7610,3579,315,8286,3264,5576,1793,9789,6943,4485,440,7500,2714,9640,7386,7113,863,4466,4034,8949,2058,8638,7878,5437,4695,3470,5710,4384,7918,1068,3064,6560,5175,1032,738,4272,5710,767,4207,8471,6635,9471,1759,8554,1441,4689,5810,7535,5570,4525,6769,4817,3937,9566,893,5009,4788,9486,8083,7307,8680,6012,6327,6113,3091,7755,9118,8526,8227,3813,4066,1326,734,412,4955,5872,1194,7971,4152,8782,9849,574,2173,676,4120,6157,6767,966,9354,2139,5988,4962,8865,6939,8175,8554,7296,4534,6989,1204,3978,7181,7201,2779,3201,2961,6705,2483,8015,758,6442,5136,6023,3430,6162,3795,1210,9576,6458,339,7917,8226,1084,7832,9453,4364,9150,8,9592,6746,2046,277,332,2353,8355,3636,2689,4076,1676,5900,5198,879,7911,4596,1806,2959,408,3085,8133,9990,2534,4134,3864,1427,3265,8803,1816,2444,1141,1532,121,8661,2791,58,304,9982,5492,2586,6326,4437,803,6844,9874,6534,1236,8386,9200,8902,1917,1826,4769,5642,8728,4964,6485,8157,7911,6516,3270,4716,2252,1712,5831,9540,6549,4088,1536,8806,7200,4784,4715,5650,2093,371,3703,8768,2666,705,2819,4176,5013,4242,1485,4967,2992,2881,9880,9872,9046,6543,7344,5506,5570,2647,4285,4265,3868,9052,4298,2151,4707,7963,1247,5491,3742,280,8014,3141,5411,5251,6691,3460,8639,1781,1037,8003,1977,6242,671,6946,1371,8352,2440,2625,9881,5251,9037,2601,6517,9839,9366,7171,4554,1416,6181,7393,6852,9784,5911,9557,2894,1636,8720,333,66,2085,6512,7226,9441,8900,5093,3367,9147,5444,3692,3689,4375,5064,6340,8918,7540,9937,8237,634,2693,2071,1866,9091,6333,4715,1380,7003,5674,4975,3818,2344,7051,8540,6307,627,6785,6647,2494,9515,1375,2234,2531,8709,5117,1032,7481,5036,436,7804,6354,6118,5334,6131,8486,320,6211,8790,4724,3423,9908,470,9848,8455,4476,3704,3867,595,3873,6658,8297,1624,8937,3231,179,35,8163,5690,4881,2,814,4890,8317,8941,8987,6577,1085,846,1871,9961,9353,4868,8611,6418,7241,6288,3262,6880,6078,8536,3854,7324,6815,8747,8572,2195,494,9721,9262,762,9678,6505,6471,5454,9863,1337,3322,7110,1717,6151,4436,8389,2459,1686,8744,4341,8410,8330,1616,8758,4043,2400,7809,9309,3249,4191,6279,6257,7375,2744,2659,6389,5651,7852,3230,8858,5379,353,9107,793,1201,7489,6919,564,8050,726,8721,8638,4717,6175,9240,3958,2971,2059,5195,4338,2091,6723,9253,5664,4083,9045,2309,5048,7469,1724,6545,1306,5815,1580,5762,9583,1612,2861,2464,2118,5014,1690,4484,4027,7751,4947,2118,471,9274,3390,2695,7891,8584,8607,9437,1404,537,6049,4087,2536,661,8990,3425,2108,3930,5189,167,1581,9766,4107,2943,5295,8578,4021,1904,5625,3591,5919,7898,144,9203,7475,2951,4637,3418,1869,6220,1373,8529,1127,7992,1718,8791,0,1868,9369,4613,7712,8241,8973,5112,9321,9512,763,6313,7309,1398,9835,4293,8394,3548,6200,8596,2804,3858,4807,3580,6408,208,9073,2067,8559,4791,4559,6649,2282,6320,4553,736,5391,5068,2294,9173,1808,8215,7880,1766,718,6825,6157,9914,7160,5090,741,4684,2423,4034,3668,4341,9591,1057,2671,6713,2036,5125,698,8707,9983,2130,9893,7375,5692,2072,2012,2145,4227,9173,1724,9181,4802,1578,8004,3866,6478,3319,2637,4885,6527,8562,6953,6067,2177,7206,5726,5445,4999,7987,1364,466,7340,1109,2120,3916,2494,7658,607,2324,7222,2301,7520,566,749,3746,6118,3827,699,3431,4135,3068,5530,3219,9563,872,6127,412,1926,3274,9378,46,8687,7156,9853,3802,2646,326,4269,2542,7418,9033,1119,2344,7223,670,872,6162,3685,4427,9984,7190,5731,520,6028,7001,2122,3423,1450,7208,7065,6966,1145,6527,9163,9762,291,2584,3880,4208,7259,9688,5929,1332,916,9938,417,4982,5264,4795,2806,8604,9258,5400,3464,3928,4405,7542,4437,485,2931,8209,1523,8157,8151,8051,5001,865,7696,4172,8528,3863,8320,3689,2594,4488,365,6513,592,4373,889,9863,2133,9052,5629,1295,8845,3741,64,3960,7038,4793,3815,73,8667,5069,391,6097,8090,7662,679,3203,4729,1316,3689,9356,7129,1864,8513,9085,4685,2446,3383,3105,2578,8727,823,2857,4114,6898,7920,9044,6908,6130,2266,2134,9773,5309,3226,3302,9245,6142,4477,9919,5163,3332,9499,8944,3656,5975,9875,1837,1376,7727,9378,4283,5193,5733,5911,6248,5164,5757,6305,7884,4181,2470,8336,7217,3433,3201,2790,7483,1351,9791,3504,7142,5865,6677,2120,8195,6722,5781,6994,3270,4581,8774,9039,2544,2175,377,5021,7973,2381,278,3400,7262,4675,3542,2858,4648,9806,6048,8879,2508,8498,1257,8593,6518,301,9888,6430,8262,2518,7311,6507,7875,4193,970,6730,6689,2831,5527,3006,6032,3853,2940,2663,1180,8382,9896,8991,613,135,3976,1661,6850,348,1223,2313,5415,783,5085,3917,5184,966,8045,9091,8586,5428,4476,9326,1541,4264,5461,7894,4182,6029,2326,4377,1830,414,4089,5885,2211,6801,7442,2360,8652,6709,4144,5272,8894,9359,980,9442,4611,7140,772,7992,5910,4398,8474,2687,2009,369,3204,9791,2411,4027,662,7957,5957,1497,3220,2018,2779,3027,732,259,6622,1593,9991,6434,8821,8828,4665,7747,3327,416,4058,137,3561,3655,783,1046,9250,2610,7456,6181,9107,3568,33,6994,5585,8897,2710,3797,9070,8748,502,6468,4311,5131,4642,2189,3456,3979,21,708,5845,2423,969,6593,4619,6014,4492,7489,4895,326,7046,4115,6279,1769,3755,4380,6000,222,7299,3364,8296,7236,4348,1362,5206,9104,8442,4710,1289,2284,5713,8119,1075,3117,8279,8183,2678,903,787,6276,9119,1158,6158,2928,98,1684,1705,5317,5359,7851,98,8636,5426,1768,8523,9732,6724,9642,7736,2926,776,3849,7442,5916,391,5878,7649,6086,6323,1545,9207,2138,4442,6557,8928,2927,4014,4899,8563,5097,4675,8509,2951,4081,6446,6242,6455,6963,3891,4937,8167,1910,2721,8034,7527,7099,1800,503,1181,5352,3547,7914,5890,387,1136,4598,2304,9501,508,9532,2871,5366,1100,7211,6359,2157,2158,6505,3369,2980,9286,4365,5640,9546,6061,2572,5371,5831,5429,6906,5808,3095,9109,733,8219,8331,679,557,318,7093,4636,8598,9286,8562,8926,9336,2813,6176,1989,5112,5314,7354,8224,8168,5654,6103,9566,5243,1881,5525,3832,7663,1829,5935,7147,9994,9847,651,4291,7120,4745,609,9618,5518,5451,2726,3705,4786,2307,6679,6149,4675,730,5155,393,5282,5585,1379,3435,8349,3657,8232,7087,2308,4842,2888,3825,8387,7766,2821,6852,8379,2500,4232,1977,3419,5545,3923,2438,7560,5688,6137,3088,6322,3678,8362,460,5789,1034,3853,9371,3794,5777,4361,5568,198,8528,2984,362,7873,6732,9260,2545,6719,4187,5659,1375,3854,2751,4015,8332,9177,3387,1272,44,6787,5001,3421,6949,2124,3818,3457,9244,7010,587,139,5514,5639,1947,3917,9840,9451,6680,7839,4748,9790,2331,4951,6849,8021,4703,8244,7015,9431,4471,9388,9346,5152,9745,4898,9307,2573,9271,9372,8562,4043,7229,6404,441,4084,3143,9988,3262,3560,9130,3294,7295,8155,6447,5129,784,7526,257,4502,8670,5844,9231,2471,8169,3896,880,6530,2346,8440,5202,7554,4453,5192,31,6454,1230,4510,8318,6435,2226,1119,3693,8160,2295,9394,1369,3161,2065,5082,4572,969,8569,288,2428,9301,4276,163,9781,7883]
) => 1274114
ways_to_split([0, 0, 0, 0, 0]) => 6
# @leetup=custom
