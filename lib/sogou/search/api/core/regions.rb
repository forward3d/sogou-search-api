module Sogou
  module Search
    module Api
      module Core
        module Regions
          REGIONS_CODE = {
            1 => 'All regions',
            1000 => 'Beijing',
            2000 => 'Shanghai',
            3000 => 'Tianjin',
            4000 => 'Guangdong',
            5000 => 'Fujian',
            8000 => 'Hainan',
            9000 => 'Anhui',
            10000 => 'Guizhou',
            11000 => 'Gansu',
            12000 => 'Guangxi',
            13000 => 'Hebei',
            14000 => 'Henan',
            15000 => 'Heilongjiang',
            16000 => 'Hubei',
            17000 => 'Hunan',
            18000 => 'Jilin',
            19000 => 'Jiangsu',
            20000 => 'Jiangxi',
            21000 => 'Liaoning',
            22000 => 'Inner Mongolia',
            23000 => 'Ningxia',
            24000 => 'Qinghai',
            25000 => 'Shandong',
            26000 => 'Shanxi',
            27000 => 'Shaanxi',
            28000 => 'Sichuan',
            29000 => 'Tibet',
            30000 => 'Xinjiang',
            31000 => 'Yunnan',
            32000 => 'Zhejiang',
            33000 => 'Chongqing',
            34000 => 'Hong Kong, Maucao and other regions',
            34100 => 'Hong Kong',
            34200 => 'Taiwan',
            34300 => 'Macao',
            34400 => 'overseas',
            35000 => 'No region',
             4085 => 'Chaozhou City',
             4116 => 'Dongguan city',
             4090 => 'Foshan City',
             4084 => 'Guangzhou City',
             4115 => 'Heyuan City',
             4117 => 'Huizhou',
             4082 => 'Jiangmen',
             4083 => 'Jieyang City',
             4086 => 'Maoming City',
             4088 => 'Meizhou City',
             4089 => 'Qingyuan City',
             4091 => 'Shan Tou',
             4092 => 'Shanwei City',
             4094 => 'Shaoguan City',
             4093 => 'Shenzhen',
             4109 => 'Yangjiang City',
             4111 => 'Yunfu City',
             4110 => 'Zhangjiang City',
             4114 => 'Zhaoqing',
             4112 => 'Zhongshan City',
             4113 => 'Zhuhai city',
             5081 => 'Fuzhou',
             5050 => 'Longyan City',
             5049 => 'Nanping City',
             5051 => 'Ningde City',
             5048 => 'Putian City',
             5052 => 'Quanzhou',
             5066 => 'Sanming City',
             5070 => 'Xiamen City',
             5080 => 'Zhangzhou City',
             8493 => 'Baisha Li Autonomous County',
             8488 => 'Baoting Li and Miao Autonomous County',
             8492 => 'Changjiang Li Autonomous County',
             8487 => 'Chengmai County',
             8303 => 'Pizhou City',
             8484 => 'Ding\'an County',
             8296 => 'Oriental City',
             8302 => 'Haikou',
             8490 => 'Le Dong Li Autonomous County',
             8491 => 'Lingao County',
             8486 => 'Lingshui Li Autonomous County',
             8297 => 'Qionghai City',
             8489 => 'Joan Li and Miao Autonomous County',
             8298 => 'Sanya City',
             8295 => 'Sansha City',
             8485 => 'Tunchang County',
             8301 => 'Wanning City',
             8299 => 'Wenchang City',
             8300 => 'Wuzhishan City',
             9128 => 'Anqing City',
             9141 => 'Bengbu',
             9143 => 'Bozhou City',
             9130 => 'Chizhou city',
             9131 => 'Chuzhou City',
             9140 => 'Fuyang City',
             9142 => 'Hefei',
             9127 => 'Huaibei City',
             9133 => 'Huainan City',
             9132 => 'Huangshan City',
             9135 => 'Lu\'an City',
             9134 => 'Ma\'anshan City',
             9138 => 'Tongling City',
             9139 => 'Wuhu',
             9137 => 'Suzhou City',
             9136 => 'Declare the city',
            10119 => 'Anshun City',
            10124 => 'Bijie City',
            10118 => 'Guiyang City',
            10120 => 'Liupanshui City',
            10122 => 'Qiandongnan Miao and Dong Autonomous Prefecture',
            10121 => 'Qiannan Buyi and Miao Autonomous Prefecture',
            10123 => 'Southwest Guizhou Buyi and Miao Autonomous Prefecture',
            10125 => 'Tongren City',
            10126 => 'Zunyi City',
            11267 => 'Silver City',
            11263 => 'Dingxi City',
            11477 => 'Gannan Tibetan Autonomous Prefecture',
            11257 => 'Jiayuguan City',
            11256 => 'Jinchang City',
            11255 => 'Jiuquan City',
            11258 => 'Lan\'Zhou City',
            11261 => 'Linxia Hui Autonomous Prefecture',
            11259 => 'Longnan City',
            11260 => 'Pingliang City',
            11262 => 'Qingyang City',
            11265 => 'Tianshui City',
            11264 => 'Wuwei City',
            11266 => 'Zhangye City',
            12108 => 'Baise City',
            12104 => 'Beihai City',
            12478 => 'Chongzuo City',
            12098 => 'Fangchenggang City',
            12096 => 'Guigang City',
            12095 => 'Guilin',
            12106 => 'Hechi City',
            12107 => 'Hezhou City',
            12100 => 'Laibin city',
            12101 => 'Liuzhou City',
            12099 => 'NanNing City',
            12102 => 'Qinzhou City',
            12103 => 'Wuzhou City',
            12105 => 'Yulin City',
            13304 => 'Baoding',
            13305 => 'Cangzhou City',
            13306 => 'Chengde City',
            13330 => 'Handan',
            13332 => 'Hengshui City',
            13307 => 'Langfang City',
            13325 => 'Qinhuangdao City',
            13327 => 'Shijiazhuang City',
            13329 => 'Tangshan City',
            13326 => 'Xingtai city',
            13331 => 'Zhangjiakou City',
            14309 => 'Anyang City',
            14323 => 'Hebi City',
            14476 => 'Jiyuan City',
            14308 => 'Jiaozuo City',
            14310 => 'Kaifeng City',
            14311 => 'Luoyang City',
            14312 => 'Luohe City',
            14315 => 'Nanyang City',
            14313 => 'Pingdingshan City',
            14316 => 'Puyang City',
            14321 => 'Sanmenxia City',
            14320 => 'Shangqiu City',
            14317 => 'Xinxiang City',
            14318 => 'Xinyang City',
            14319 => 'Xuchang City',
            14322 => 'Zhengzhou City',
            14324 => 'Zhoukou City',
            14314 => 'Zhumadian City',
            15342 => 'Daqing City',
            15343 => 'Daxinganling area',
            15335 => 'Harbin City',
            15344 => 'Hegang City',
            15345 => 'Heihe city',
            15333 => 'Jixi City',
            15334 => 'Jiamusi City',
            15336 => 'Mudanjiang City',
            15338 => 'Qitaihe City',
            15337 => 'Qiqihar City',
            15340 => 'Shuangyashan City',
            15339 => 'Suihua City',
            15341 => 'Yichun City',
            16377 => 'Ezhou City',
            16366 => 'Enshi Tujia and Miao Autonomous Prefecture',
            16349 => 'Huanggang City',
            16348 => 'Yellowstone City',
            16346 => 'Jingmen City',
            16347 => 'Jingzhou City',
            16364 => 'Qianjiang City',
            16368 => 'Shennongjia forest area',
            16369 => 'Shiyan City',
            16367 => 'Suizhou City',
            16373 => 'Tianmen City',
            16371 => 'Wuhan',
            16372 => 'Xiantao City',
            16375 => 'Xianning City',
            16370 => 'Xiangyang City',
            16365 => 'Xiaogan City',
            16376 => 'Yichang City',
            17351 => 'Changde City',
            17353 => 'Chenzhou City',
            17360 => 'Hengyang City',
            17350 => 'Huaihua City',
            17354 => 'Loudi City',
            17355 => 'Shaoyang City',
            17356 => 'Xiangtan City',
            17357 => 'Xiangxi Tujia and Miao Autonomous Prefecture',
            17359 => 'Yiyang City',
            17362 => 'Yongzhou City',
            17361 => 'Yueyang City',
            17358 => 'Zhangjiajie City',
            17352 => 'Changsha City',
            17363 => 'Zhuzhou City',
            18039 => 'White City',
            18042 => 'Hakusan City',
            18038 => 'Jilin City',
            18041 => 'Liaoyuan City',
            18043 => 'Siping City',
            18044 => 'Matsubara City',
            18045 => 'Tonghua City',
            18047 => 'Yanbian Korean Autonomous Prefecture',
            18040 => 'Changchun City',
            19054 => 'Changzhou City',
            19053 => 'Huaian city',
            19057 => 'Lianyungang City',
            19055 => 'Nanjing',
            19056 => 'Nantong city',
            19059 => 'Suzhou City',
            19061 => 'Taizhou City',
            19062 => 'Wuxi City',
            19060 => 'Suqian City',
            19058 => 'Xuzhou',
            19063 => 'Yancheng',
            19064 => 'Yangzhou',
            19065 => 'Zhenjiang',
            20078 => 'Fuzhou City',
            20077 => 'Ganzhou City',
            20068 => 'Ji\'an City',
            20069 => 'Jingdezhen City',
            20067 => 'Jiujiang City',
            20072 => 'Nanchang City',
            20071 => 'Pingxiang City',
            20074 => 'Shangrao City',
            20073 => 'Xinyu City',
            20075 => 'Yichun City',
            20076 => 'Yingtan City',
            21151 => 'Anshan City',
            21145 => 'Benxi City',
            21147 => 'Chaoyang City',
            21155 => 'Dalian City',
            21144 => 'Dandong City',
            21152 => 'Fushun City',
            21150 => 'Fuxin City',
            21157 => 'Huludao City',
            21146 => 'Jinzhou City',
            21148 => 'Liaoyang City',
            21149 => 'Panjin City',
            21153 => 'Shenyang city',
            21154 => 'Tieling City',
            21156 => 'Yingkou City',
            22159 => 'Alxa League',
            22162 => 'Bayannur City',
            22169 => 'Baotou City',
            22158 => 'Chifeng City',
            22168 => 'Ordos City',
            22167 => 'Hohhot',
            22166 => 'Hulunbeir',
            22161 => 'Tongliao City',
            22164 => 'Wuhai City',
            22163 => 'Wulanchabu',
            22165 => 'Xilin Gol League',
            22160 => 'Hing UNITA',
            23170 => 'Guyuan City',
            23171 => 'Shizuishan City',
            23172 => 'Wuzhong City',
            23174 => 'Yinchuan City',
            23173 => 'Zhongwei City',
            24496 => 'Guoluo Tibetan Autonomous Prefecture',
            24494 => 'Haibei Tibetan Autonomous Prefecture',
            24176 => 'Haidong area',
            24479 => 'Hainan Tibetan Autonomous Prefecture',
            24177 => 'Haixi Mongolian and Tibetan Autonomous Prefecture',
            24495 => 'Huangnan Tibetan Autonomous Prefecture',
            24175 => 'Xining City',
            24178 => 'Yushu Tibetan Autonomous Prefecture',
            25223 => 'Binzhou City',
            25200 => 'Texas City',
            25220 => 'Dongying City',
            25222 => 'Heze City',
            25196 => 'Jinan City',
            25197 => 'Jining City',
            25198 => 'Laiwu City',
            25199 => 'Liaocheng',
            25201 => 'Linyi City',
            25202 => 'Qingdao City',
            25203 => 'Rizhao City',
            25208 => 'Tai\'an City',
            25218 => 'Weihai',
            25204 => 'Weifang',
            25219 => 'City of Yantai',
            25221 => 'Zaozhuang City',
            25207 => 'Zibo City',
            26217 => 'Datong City',
            26205 => 'Jincheng City',
            26206 => 'Jinzhong City',
            26211 => 'Linfen City',
            26210 => 'Luliang City',
            26213 => 'Shuozhou City',
            26214 => 'Taiyuan',
            26212 => 'Xinzhou City',
            26215 => 'Yangquan City',
            26216 => 'Yuncheng City',
            26209 => 'Changzhi City',
            27240 => 'Ankang City',
            27239 => 'Baoji City',
            27248 => 'Hanzhong City',
            27241 => 'Shangluo City',
            27242 => 'Tongchuan City',
            27243 => 'Weinan City',
            27244 => 'Xi\'an',
            27245 => 'Xianyang City',
            27246 => 'Yan\'an City',
            27249 => 'Yulin City',
            28252 => 'Aba Tibetan and Qiang Autonomous Prefecture',
            28247 => 'Bazhong city',
            28226 => 'Chengdu',
            28250 => 'Dazhou',
            28232 => 'Deyang City',
            28236 => 'Ganzi Tibetan Autonomous Prefecture',
            28224 => 'Guang\'an City',
            28225 => 'Guangyuan City',
            28233 => 'Leshan',
            28228 => 'Liangshan Yi Autonomous Prefecture',
            28234 => 'Luzhou City',
            28227 => 'Meishan City',
            28229 => 'Mianyang City',
            28231 => 'Nanchong City',
            28235 => 'Neijiang City',
            28230 => 'Panzhihua City',
            28237 => 'Suining City',
            28251 => 'Ya\'an city',
            28254 => 'Yibin City',
            28238 => 'Ziyang City',
            28253 => 'Zigong City',
            29498 => 'Ali area',
            29480 => 'Changdu area',
            29269 => 'Lhasa city',
            29270 => 'Nyingchi area',
            29268 => 'Nagqu area',
            29271 => 'Shigatse area',
            29497 => 'Shannan area',
            30185 => 'Aksu area',
            30499 => 'Alar City',
            30182 => 'Altai region',
            30191 => 'Bayingolin Mongolia Autonomous Prefecture',
            30180 => 'Bortala Mongol Autonomous Prefecture',
            30181 => 'Changji Hui Autonomous Prefecture',
            30179 => 'Hami area',
            30195 => 'Hotan area',
            30183 => 'Kashi area',
            30184 => 'Karamay City',
            30186 => 'Kizilsu Kirgiz Autonomous Prefecture',
            30187 => 'Shihezi City',
            30188 => 'Tacheng area',
            30500 => 'Tumkuk city',
            30190 => 'Turpan area',
            30192 => 'Urumqi',
            30189 => 'Five Drainage City',
            30193 => 'Ili Kazak Autonomous Prefecture',
            31289 => 'Baoshan City',
            31283 => 'Chuxiong Yi Autonomous Prefecture',
            31292 => 'Dali Bai Autonomous Prefecture',
            31286 => 'Dehong Dai Jingpo Autonomous Prefecture',
            31482 => 'Diqing Tibetan Autonomous Prefecture',
            31293 => 'Honghe Hani and Yi Autonomous Prefecture',
            31284 => 'Kunming',
            31285 => 'Lijiang City',
            31287 => 'Lincang City',
            31481 => 'Nujiang Lisu Autonomous Prefecture',
            31290 => 'Pu\'er City',
            31288 => 'Qujing City',
            31291 => 'Wenshan Zhuang and Miao Autonomous Prefecture',
            31483 => 'Xishuangbanna Dai Autonomous Prefecture',
            31295 => 'Yuxi City',
            31294 => 'Zhaotong City',
            32280 => 'Hangzhou',
            32282 => 'Huzhou',
            32273 => 'Jiaxing City',
            32272 => 'Jinhua City',
            32275 => 'Lishui City',
            32276 => 'Ningbo City',
            32274 => 'Quzhou City',
            32277 => 'Shaoxing City',
            32279 => 'Taizhou',
            32278 => 'Wenzhou city',
            32281 => 'Zhoushan City'
          }

          def convert_regions_to_string(results)
            if results.is_a?(Hash)
              region = results['regions']
              if region
                results['regions'] = REGIONS_CODE.fetch(region.to_i, region)
              end
            elsif results.is_a?(Array)
              results = results.map { |r| convert_regions_to_string(r) }
            end

            results
          end
        end
      end
    end
  end
end
