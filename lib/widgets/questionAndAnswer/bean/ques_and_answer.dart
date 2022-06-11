/// data : {"curPage":1,"datas":[{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>很久前我们提问过:</p>\r\n<p><a href=\"https://www.wanandroid.com/wenda/show/8680\">每日一问 在Activity 的 onResume 方法中 view.postRunnable 能获取到 View 宽高吗？</a></p>\r\n<p>相信大家对于View.post都比较熟悉了，有个API与之非常类似：</p>\r\n<ol>\r\n<li>View.postOnAnimation 与View.post相比有什么区别？</li>\r\n<li>在什么情况下比较适合使用View.postOnAnimation呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22845,"link":"https://wanandroid.com/wenda/show/22845","niceDate":"2022-05-27 20:54","niceShareDate":"2022-05-27 20:53","origin":"","prefix":"","projectLink":"","publishTime":1653656051000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1653656034000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 View.post 又来了与View.postOnAnimation 有什么区别？","type":1,"userId":2,"visible":1,"zan":1},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>Android中的匿名binder是何时调用IPCThreadState.joinThreadPool()方法的，</p>\r\n<p>或者是说，android中的匿名binder的server端是在何时挂起自己等待客户端唤醒的？</p>\r\n<p>例如bindservice时，传入的ServiceConnection这个匿名的Service。</p>\r\n<blockquote>\r\n<p>来自<a href=\"https://wanandroid.com/user/132308/articles/1\">initLiu</a>，<a href=\"https://wanandroid.com/wenda/show/8857?fid=132308&amp;date=2022_05_25_18_35_38&amp;message=Android%E4%B8%AD%E7%9A%84%E5%8C%BF#msg_id2459\">问题</a></p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22814,"link":"https://wanandroid.com/wenda/show/22814","niceDate":"2022-05-25 21:00","niceShareDate":"2022-05-25 21:00","origin":"","prefix":"","projectLink":"","publishTime":1653483633000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1653483610000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"【大家提问】Android中的匿名binder与线程相关的一些问题","type":1,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p><strong> 前提条件：</strong><br><strong>mView为VISIBLE状态</strong><br>执行：</p>\r\n<pre><code>  private fun startHideAnimation() {\r\n        mView.isVisible = false\r\n        mView.startAnimation(AlphaAnimation(1.0f else 0.0f).apply {\r\n            //如果将fillAfter设置为true,即使为gone,也能接收到事件,分析下为啥?\r\n            //            fillAfter = true\r\n            duration = 250\r\n        })\r\n    }\r\n</code></pre><p><strong>现象：</strong><br>view会先执行完动画完后才GONE<br><strong>问题：</strong><br>查看源码：<br><code>view.isVisible = GONE</code> 会经历下面的流程</p>\r\n<pre><code>public void setVisibility(@Visibility int visibility) {\r\n        setFlags(visibility, VISIBILITY_MASK);\r\n    }\r\n\r\n\r\nvoid setFlags(int flags, int mask) {\r\n            //忽略部分代码\r\n\r\n            if ((changed &amp; GONE) != 0) {\r\n                    requestLayout();\r\n\r\n                    if (mParent instanceof View) {\r\n                            // GONE views noop invalidation, so invalidate the parent\r\n                            ((View) mParent).invalidate(true);\r\n          }\r\n            }\r\n}\r\n</code></pre><p><code>startAnimation</code>会经历下面的流程：</p>\r\n<pre><code>public void setAnimation(Animation animation) {\r\n                //忽略部分代码\r\n        mCurrentAnimation = animation;\r\n                invalidate(true)\r\n}\r\n</code></pre><p>而动画执行的时机是在draw()中的</p>\r\n<pre><code>applyLegacyAnimation()\r\n</code></pre><p>但此时不是已经为GONE了吗，为啥仍然能够显示并执行完动画才消失呢。<br>其实把顺序调换了，现象也是一样。感觉跟view的绘制流程有关系，但无法分析透彻，请问why？</p>\r\n<blockquote>\r\n<p>本问题由<a href=\"https://wanandroid.com/wenda/show/8857?fid=105427&amp;date=2022_05_13_12_01_32&amp;message=%20%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6%EF%BC%9AmVie\">张小飞的提问</a></p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22665,"link":"https://wanandroid.com/wenda/show/22665","niceDate":"2022-05-13 21:53","niceShareDate":"2022-05-13 21:53","origin":"","prefix":"","projectLink":"","publishTime":1652450008000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1652449986000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"【大家提问】为什么View.GONE效果不优先生效呢？","type":1,"userId":2,"visible":1,"zan":3},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>更近一直关注合规问题，其中有一次被检测到风险是：</p>\r\n<p>在Google的pixel设备中，某个进程被杀死后，然后又自动被「拉活」了，排查发现可能是各种注册的Service因为其onStartCommand返回START_STICKY导致。</p>\r\n<p>那么问题来了：</p>\r\n<ol>\r\n<li>当Service onStartCommand返回START_STICKY后，进程被杀系统是如何「复活」所在进程的？</li>\r\n<li>面对项目中一堆Service可能返回START_STICKY，如何可以在原生系统上避免被「拉活」？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22539,"link":"https://wanandroid.com/wenda/show/22539","niceDate":"2022-04-27 11:39","niceShareDate":"2022-04-27 11:39","origin":"","prefix":"","projectLink":"","publishTime":1651030789000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1651030758000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Service onStartCommand 返回STICKY是如何做到被拉活的？","type":1,"userId":2,"visible":1,"zan":3},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>在我们日常开发过程中，可能会遇到一类比较难搞的crash：<code>java.lang.VerifyError</code>，问题来了：</p>\r\n<ol>\r\n<li>哪些情况可能会导致运行时发生VerifyError？</li>\r\n<li>如何前置发现相关问题，而不必等到运行到相关代码导致应用崩溃；</li>\r\n<li>【引申问题】对于verify还有一类为dex2oat阶段verify failed，需要运行时额外在做一次classverify，可能会导致一定的性能损耗，对此情况如何避免？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22606,"link":"https://wanandroid.com/wenda/show/22606","niceDate":"2022-05-27 20:55","niceShareDate":"2022-05-06 11:35","origin":"","prefix":"","projectLink":"","publishTime":1653656113000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1651808113000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问| 如何前置发现VerifyError相关问题？","type":0,"userId":2,"visible":0,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>前两天看公众号文章：<br><a href=\"https://mp.weixin.qq.com/s/XHbJ1L5_rdvKs3AjLCvGiA\">分享一个困惑很久的问题：App前台，Activity会被回收吗？</a></p>\r\n<p>文章中源码分析阶段，看到了一些核心类：</p>\r\n<pre><code> ActivityRecord、TaskRecord、ActivityStack、ActivityDisplay、ActivityStackSupervisor\r\n</code></pre><p>绕起来有点晕。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>这些类分别起到什么作用？</li>\r\n<li>有什么好的方式帮助记忆吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":21681,"link":"https://wanandroid.com/wenda/show/21681","niceDate":"2022-05-06 11:37","niceShareDate":"2022-03-07 21:24","origin":"","prefix":"","projectLink":"","publishTime":1651808232000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1646659440000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | ActivityRecord、TaskRecord、ActivityStack、ActivityDisplay、ActivityStackSupervisor 分别是干什么的？","type":0,"userId":2,"visible":1,"zan":12},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>有时候我们会通过adb shell查看安装的debug的包一些资源信息，例如查看：</p>\r\n<pre><code>/proc/pid/fd\r\n</code></pre><p>该目录下包含该进程运行是所有打开的fd相关信息。</p>\r\n<p>如果我们直接adb shell，然后 cd /proc/pid/fd，你会发现会<code>Permission denied</code>。</p>\r\n<p>这个时候我们可以选择执行：</p>\r\n<pre><code>run-as 包名\r\ncd /proc/pid/fd\r\n</code></pre><p>就可以了。</p>\r\n<p>问题来了：<strong>run-as背后做了什么？</strong></p>\r\n<blockquote>\r\n<p>以后至少每周更新一篇。</p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22438,"link":"https://wanandroid.com/wenda/show/22438","niceDate":"2022-05-06 11:37","niceShareDate":"2022-04-15 21:11","origin":"","prefix":"","projectLink":"","publishTime":1651808228000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1650028301000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问  | run-as 背后做了什么？","type":0,"userId":2,"visible":1,"zan":4},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>正在我们在开发的时候，涉及到需要跨进程通信，尤其是较为复杂的，需要拿到服务端 binder 代理进行交互的方式。</p>\r\n<p>一般流程为：</p>\r\n<ol>\r\n<li>编写 aidl 文件；</li>\r\n<li>实现一个 Service 子类(独立进程)，复写 onBind 方法，返回 Binder&#39;s Stub；</li>\r\n<li>主进程通过调用 bindService，间接拿到 binder 驱动，然后实现 binder 通信；</li>\r\n</ol>\r\n<p>更进一步的说，很多时候，我们也可以不依赖 aidl 文件，自己去实现Stub、Proxy类，利用 binder 驱动通过 transact 方法与服务端 Stub onTransact 进行跨进程交互。</p>\r\n<p>但是依然是需要依赖 bindService 方法，去获取 binder驱动。</p>\r\n<p>可以参考：<a href=\"https://blog.csdn.net/lmj623565791/article/details/38461079/\">Android aidl Binder框架浅析</a></p>\r\n<p>不过我们今天的关注点在于：</p>\r\n<ol>\r\n<li>可以不通过 bindService ，利用别的方式来传递 “binder 驱动”来实现跨进程通信吗？</li>\r\n<li>framework 层有哪些地方使用了 1 的方式进行通信？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":21630,"link":"https://www.wanandroid.com/wenda/show/21630","niceDate":"2022-04-27 23:43","niceShareDate":"2022-03-02 00:40","origin":"","prefix":"","projectLink":"","publishTime":1651074190000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1646152857000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 可以不借助 bindService，实现跨进程 binder 通信吗？","type":0,"userId":2,"visible":1,"zan":16},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前小缘在群里问过这个问题：</p>\r\n<p><img src=\"https://wanandroid.com/blogimgs/122c7a4f-12e7-4b59-833b-0a2a1631661d.png\" alt=\"截屏2022-02-10 下午5.27.05.png\" /></p>\r\n<blockquote>\r\n<p>先不考虑其实际的使用价值，单纯从技术角度思考，其实也有场景能用上，暂时不表。</p>\r\n</blockquote>\r\n<p>我细化一下问题：</p>\r\n<p>前提类：</p>\r\n<pre><code>public class A {\r\n\r\n    private final AInner inner = new AInner();\r\n\r\n    private final class AInner {\r\n\r\n        public void b() {\r\n            Log.d(&quot;tec-hack&quot;, &quot;AInner b invoke&quot;);\r\n        }\r\n    }\r\n}\r\n</code></pre><p>注意，暂且认为该类是系统类，我们无法在编译期对齐修改。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>如何构造一个AInner的子类对象？</li>\r\n<li>完成对A的inner成员变量替换。</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":21409,"link":"https://wanandroid.com/wenda/show/21409","niceDate":"2022-04-15 21:13","niceShareDate":"2022-02-11 14:21","origin":"","prefix":"","projectLink":"","publishTime":1650028413000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1644560499000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 被声明为private final 的内部类，能生成一个子类对象吗？逆天篡改~","type":0,"userId":2,"visible":0,"zan":11},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前有聊过：<a href=\"https://www.wanandroid.com/wenda/show/18615\">每日一问 | 我们经常说到的 Android 脱糖指的是什么？</a>  已经有同学提到可能会影响到编译期间 Transform 的编写。</p>\r\n<p>今天就来详细了解下，例如比较常见的需求：</p>\r\n<p><strong>在编译期间通过字节码处理View防止重复点击</strong></p>\r\n<ol>\r\n<li>在该案例下，需要了解脱糖的时机以及流程么？</li>\r\n<li>脱糖对该案例会造成什么样的影响？</li>\r\n<li>对于导致的问题，如何处理呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20946,"link":"https://www.wanandroid.com/wenda/show/20946","niceDate":"2022-03-07 21:26","niceShareDate":"2021-12-25 18:39","origin":"","prefix":"","projectLink":"","publishTime":1646659580000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1640428781000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 脱糖对于Android 打包期间插桩的有什么影响？","type":0,"userId":2,"visible":0,"zan":1},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>在我们学习 Java类加载流程的时候，一般都会提到：</p>\r\n<p>加载 -&gt; 连接 -&gt; 初始化 三个过程。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>这三个过程中每个环节主要做哪些事？</li>\r\n<li>.class vs Class.forName() vs loadClass()  这三者有什么不同？可以结合三个过程来描述</li>\r\n<li>Android 中类加载有个 verify class的过程上述哪个流程会触发？什么情况下会出现 verify class error 情况？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":21251,"link":"https://www.wanandroid.com/wenda/show/21251","niceDate":"2022-02-11 14:22","niceShareDate":"2022-01-19 00:51","origin":"","prefix":"","projectLink":"","publishTime":1644560546000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1642524702000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 .class vs Class.forName() vs loadClass() 类加载傻傻分不清楚？","type":0,"userId":2,"visible":1,"zan":1},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>在上一问中：</p>\r\n<p><a href=\"https://wanandroid.com/wenda/show/20535\">每日一问 | android hidden api 不是禁用反射，以及如何突破，「元反射」不行了？</a></p>\r\n<p>中，我也从中学到了很多，其实我预期的答案是小缘所回来的。但是，其他同学的回答完全超出预期，尤其是这个库<a href=\"https://github.com/LSPosed/AndroidHiddenApiBypass\">https://github.com/LSPosed/AndroidHiddenApiBypass</a> 里面的 UnSafe 操作太秀了。</p>\r\n<p>刚哥也提到 stub api 的方式，也能某些情况下解决问题。</p>\r\n<p>忽然想到一个问题：</p>\r\n<p>如果一个接口是 hidden 的，我们是否可以构造出其实现类？如果可以，有几种方式呢？</p>\r\n<p>更后，我们团队一直在招人，欢迎联系<a href=\"https://wanandroid.com/blog/show/2949\">招聘要求</a></p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20867,"link":"https://www.wanandroid.com/wenda/show/20867","niceDate":"2022-02-08 23:51","niceShareDate":"2021-12-19 17:15","origin":"","prefix":"","projectLink":"","publishTime":1644335483000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1639905347000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问  | 如何构造一个 hide interface 的实现类？","type":0,"userId":2,"visible":1,"zan":2},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>出这个问题有两个原因：</p>\r\n<ol>\r\n<li>之前在公众号推文，很多同学认为android 9之后只要是反射都不被允许了，希望拨正这个观念；</li>\r\n<li>虽然已经有很多好文提到android hidden api如何突破，但是大多是都是基于android 9来测试的，实际上随着targetSDKVersion的提升，很多方案都失效了，包括「反射的反射」这个方案，所以我觉得还是可以讨论下；</li>\r\n</ol>\r\n<p>那么问题来了：</p>\r\n<ol>\r\n<li>hidden api是指不让使用反射吗？</li>\r\n<li>hidden api list在每个系统版本上，怎么知道哪些api被限制反射使用呢？</li>\r\n<li>hidden api 官方的限制思路是怎么样的？</li>\r\n<li>目前市面上突破android hidden api的方案，能够支持targetSDKVersion 提升到android 10 , 11, 12吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20535,"link":"https://wanandroid.com/wenda/show/20535","niceDate":"2022-02-08 23:51","niceShareDate":"2021-11-19 11:57","origin":"","prefix":"","projectLink":"","publishTime":1644335474000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1637294221000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | android hidden api 不是禁用反射，以及如何突破，「元反射」不行了？","type":0,"userId":2,"visible":1,"zan":21},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>Gson大家一定不陌生，在很多项目中都大规模使用。</p>\r\n<p>例如常见的：</p>\r\n<pre><code>网络请求\r\n    -&gt;返回Json数据\r\n    -&gt;Gson解析为对象\r\n    -&gt;渲染页面\r\n</code></pre><p>很多时候，历史项目包含很多Gson解析对象在UI线程的操作，或者说即使在子线程其实也会影响页面展现速度。</p>\r\n<p>大家都了解Gson对于对象的解析，如果不单独的配置TypeAdapter，那么其实内部是充满反射的。</p>\r\n<p>问题来了：</p>\r\n<p><strong>有没有什么低侵入的方案可以尽可能去除反射操作，从而提升运行效率？描述思路即可。</strong></p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":19623,"link":"https://wanandroid.com/wenda/show/19623","niceDate":"2021-12-02 00:50","niceShareDate":"2021-08-30 21:36","origin":"","prefix":"","projectLink":"","publishTime":1638377423000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1630330596000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Gson中序列化对象的操作有低侵入的优化方案吗？","type":0,"userId":2,"visible":1,"zan":9},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>今天意外在崩溃上报平台发现一个异常为UndeclaredThrowableException，看名字就比较好奇，大家可以搜索下，尝试回答：</p>\r\n<ol>\r\n<li>什么时候会抛出此异常？</li>\r\n<li>为什么[1]中重新封装为此异常抛出，这么设计的原因是？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20514,"link":"https://www.wanandroid.com/wenda/show/20514","niceDate":"2021-12-02 00:50","niceShareDate":"2021-11-17 00:56","origin":"","prefix":"","projectLink":"","publishTime":1638377410000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1637081819000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 UndeclaredThrowableException 是什么异常？","type":0,"userId":2,"visible":1,"zan":2},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>问题如题：</p>\r\n<p>ViewGroup 的 measureChild 方法和 measureChildWithMargins 方法的区别是什么，如何在实际开发中决定选择使用哪一个？</p>\r\n<p>来源：<a href=\"https://wanandroid.com/wenda/show/8857?fid=833&amp;date=2021_10_12_09_13_15&amp;message=ViewGroup#msg_id2204\">可以从这里提问</a>，欢迎大家踊跃提问~</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20130,"link":"https://wanandroid.com/wenda/show/20130","niceDate":"2021-12-02 00:50","niceShareDate":"2021-10-12 20:20","origin":"","prefix":"","projectLink":"","publishTime":1638377400000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1634041255000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"【大家提问】 | ViewGroup 的 measureChild 方法和 measureChildWithMargins 方法的区别是什么？","type":0,"userId":2,"visible":1,"zan":9},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":true,"courseId":13,"desc":"<p>关于 Activity 重建，我们探究几个问题：</p>\r\n<ol>\r\n<li>当前 app 正在前台运行，不在栈顶的 Activity 有可能会因为系统资源，例如内存等不足回收吗？</li>\r\n<li>当 app 处于后台运行，app 进程未被杀死，其内部的 Activity 会被回收吗？</li>\r\n<li>当 app 处于后台运行，app 的进程会被杀死吗？</li>\r\n</ol>\r\n<p>如果有能力，建议解释过程中可以配合源码，不一定要全部答出来~</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18965,"link":"https://www.wanandroid.com/wenda/show/18965","niceDate":"2021-08-30 21:37","niceShareDate":"2021-07-15 00:27","origin":"","prefix":"","projectLink":"","publishTime":1630330636000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1626280047000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 关于 Activity 重建，值得探究的几个问题","type":0,"userId":2,"visible":1,"zan":19},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>了解应用启动相关代码的同学一定知道：</p>\r\n<p>我们的应用启动时，每个进程会对应一个ActivityThread对象，而Application对象在正常情况下也是每个进程只有一个？</p>\r\n<p>但是如果你看ActivityThread的源码，你会发现：</p>\r\n<pre><code>public final class ActivityThread {\r\n    final ArrayList&lt;Application&gt; mAllApplications\r\n                = new ArrayList&lt;Application&gt;();\r\n    ...\r\n}\r\n</code></pre><p><a href=\"https://cs.android.com/android/platform/superproject/+/master:frameworks/base/core/java/android/app/ActivityThread.java;l=237?q=ActivitYtHREAD&amp;sq=&amp;ss=android%2Fplatform%2Fsuperproject\">源码直达</a></p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>什么情况下一个ActivityThread对象，会对应多个Application对象，即mAllApplications.size() &gt; 1；</li>\r\n<li>如果找到了1的情况，支持这个目的是？</li>\r\n</ol>\r\n<blockquote>\r\n<p>本问题归因为好奇，硬说使用场景在一些插件化中会尝试构造Application会调用这个，但是这个肯定不是google的本意。</p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":19550,"link":"https://wanandroid.com/wenda/show/19550","niceDate":"2021-08-30 21:36","niceShareDate":"2021-08-25 18:10","origin":"","prefix":"","projectLink":"","publishTime":1630330617000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1629886237000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 好奇ActivityThread中为什么会有一个 Application的集合？","type":0,"userId":2,"visible":1,"zan":6},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>今天我们来讨论下 Jetpack 中的 ViewModel:</p>\r\n<p>大家都知道 ViewModel 有一个特点就是能够在 Activity 发生重建时做数据的恢复。</p>\r\n<p>我们就针对这个「重建」与「恢复」问一些问题：</p>\r\n<ol>\r\n<li>ViewModel 在 Activity 发生旋转等配置发生变化所导致的重建，能恢复数据吗？</li>\r\n<li>如果 1 能，尝试从源码角度分析，数据存在哪？怎么存储的？怎么读取的？</li>\r\n<li>当 Activity 切换到后台，被系统杀死（进程存活），此时回到 Activity 导致的重建，ViewModel 的数据能恢复吗？为什么？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18930,"link":"https://www.wanandroid.com/wenda/show/18930","niceDate":"2021-08-25 18:11","niceShareDate":"2021-07-11 22:05","origin":"","prefix":"","projectLink":"","publishTime":1629886294000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1626012349000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | ViewModel 在什么情况下的「销毁重建」能够对数据进行无缝恢复？","type":0,"userId":2,"visible":1,"zan":30},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":true,"courseId":13,"desc":"<p>在我们的印象里，如果构造一个 Dialog 传入一个非 Activiy 的 context，则可能会出现 bad token exception。</p>\r\n<p>今天我们就来彻底搞清楚这一块，问题来了：</p>\r\n<ol>\r\n<li>为什么传入一个非 Activity 的 context 会出现错误？</li>\r\n<li>传入的 context 一定要是 Activity 吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18281,"link":"https://www.wanandroid.com/wenda/show/18281","niceDate":"2021-07-11 22:06","niceShareDate":"2021-05-13 00:20","origin":"","prefix":"","projectLink":"","publishTime":1626012414000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1620836414000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Dialog 的构造方法的 context 必须传入 Activity吗？","type":0,"userId":2,"visible":1,"zan":23},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>更近一直在补一些 C/C++的知识，导致 Android 相关知识看的少了，导致每日一问憋半天憋不出来。</p>\r\n<p>还好，我又更新了...</p>\r\n<p>之前公众号推文的时候，推送到混淆的时候，经常会说到「脱糖」，也有同学在留言区问什么是脱糖呀？</p>\r\n<p>今天的问题就是为了带大家彻底搞清楚什么是脱糖：</p>\r\n<ol>\r\n<li>脱糖产生的原因是什么？</li>\r\n<li>脱糖在 D8 产生后发生了什么变化？</li>\r\n<li>脱糖我们需要关注吗？在我们做什么事情的时候可能会影响到呢？</li>\r\n</ol>\r\n<p>求解答~</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18615,"link":"https://www.wanandroid.com/wenda/show/18615","niceDate":"2021-07-11 22:06","niceShareDate":"2021-06-14 22:56","origin":"","prefix":"","projectLink":"","publishTime":1626012397000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1623682607000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 我们经常说到的 Android 脱糖指的是什么？","type":0,"userId":2,"visible":1,"zan":15},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":true,"courseId":13,"desc":"<p>更近聊到一种编译优化的方案，号称秒级别：</p>\r\n<ol>\r\n<li>每次拿到修改 java 文件，编译为 class；</li>\r\n<li>将 1 中的 class 转成 dex；</li>\r\n<li>push 到 sdcard，然后重启生效；</li>\r\n</ol>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>第一步中将特定的 Java 文件转成 class 如何操作？如何极快的操作？</li>\r\n<li>如果是 kotlin 文件呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18453,"link":"https://www.wanandroid.com/wenda/show/18453","niceDate":"2021-07-11 22:06","niceShareDate":"2021-05-28 00:28","origin":"","prefix":"","projectLink":"","publishTime":1626012386000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1622132918000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 极致的编译优化如何实现？ [更新]","type":0,"userId":2,"visible":1,"zan":12},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前看文章，经常看到一些分析 Dialog、PopupWindow的文章，有些文章分析如下：</p>\r\n<p><strong>Dialog有自己独立的Window，而PopupWindow没有，所以PopupWindow可以称之为子窗口，而 Dialog不是。</strong></p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>这种说法合理吗？</li>\r\n<li>在Android中，有没有子窗口的概念呢？如果有到底应该以什么为标准呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18192,"link":"https://wanandroid.com/wenda/show/18192","niceDate":"2021-05-28 00:29","niceShareDate":"2021-05-06 00:15","origin":"","prefix":"","projectLink":"","publishTime":1622132956000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1620231346000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Android中的子窗口到底指的是什么？","type":0,"userId":2,"visible":1,"zan":16},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>对于 Intent 大家肯定都不陌生，今天我们聊一聊它的一个近亲：<strong>PendingIntent</strong></p>\r\n<p>官方对其描述为：</p>\r\n<p>A description of an Intent and target action to perform with it. </p>\r\n<p>那么问题来了：</p>\r\n<ol>\r\n<li>PendingIntent 仅仅是对 Intent 的一个封装吗？</li>\r\n<li>如果1 不是，那么为什么 PendingIntent与 Intent 有何不同，它的定位是什么样的呢？</li>\r\n<li>对于 2 的回答，如果从源码侧佐证？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18072,"link":"https://www.wanandroid.com/wenda/show/18072","niceDate":"2021-05-28 00:29","niceShareDate":"2021-04-24 22:58","origin":"","prefix":"","projectLink":"","publishTime":1622132946000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1619276317000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 已经有了 Intent，那为啥还要 PendingIntent?","type":0,"userId":2,"visible":1,"zan":8}],"offset":0,"over":false,"pageCount":7,"size":24,"total":159}
/// errorCode : 0
/// errorMsg : ""

class QuesAndAnswerBean {
  QuesAndAnswerBean({
    QuesAndAnswerDeatailBean data,
    int errorCode,
    String errorMsg,
  }) {
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
  }

  QuesAndAnswerBean.fromJson(dynamic json) {
    _data = json['data'] != null ? QuesAndAnswerDeatailBean.fromJson(json['data']) : null;
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }

  QuesAndAnswerDeatailBean _data;
  int _errorCode;
  String _errorMsg;

  QuesAndAnswerBean copyWith({
    QuesAndAnswerDeatailBean data,
    int errorCode,
    String errorMsg,
  }) =>
      QuesAndAnswerBean(
        data: data ?? _data,
        errorCode: errorCode ?? _errorCode,
        errorMsg: errorMsg ?? _errorMsg,
      );

  QuesAndAnswerDeatailBean get data => _data;

  int get errorCode => _errorCode;

  String get errorMsg => _errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data.toJson();
    }
    map['errorCode'] = _errorCode;
    map['errorMsg'] = _errorMsg;
    return map;
  }
}

/// curPage : 1
/// datas : [{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>很久前我们提问过:</p>\r\n<p><a href=\"https://www.wanandroid.com/wenda/show/8680\">每日一问 在Activity 的 onResume 方法中 view.postRunnable 能获取到 View 宽高吗？</a></p>\r\n<p>相信大家对于View.post都比较熟悉了，有个API与之非常类似：</p>\r\n<ol>\r\n<li>View.postOnAnimation 与View.post相比有什么区别？</li>\r\n<li>在什么情况下比较适合使用View.postOnAnimation呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22845,"link":"https://wanandroid.com/wenda/show/22845","niceDate":"2022-05-27 20:54","niceShareDate":"2022-05-27 20:53","origin":"","prefix":"","projectLink":"","publishTime":1653656051000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1653656034000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 View.post 又来了与View.postOnAnimation 有什么区别？","type":1,"userId":2,"visible":1,"zan":1},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>Android中的匿名binder是何时调用IPCThreadState.joinThreadPool()方法的，</p>\r\n<p>或者是说，android中的匿名binder的server端是在何时挂起自己等待客户端唤醒的？</p>\r\n<p>例如bindservice时，传入的ServiceConnection这个匿名的Service。</p>\r\n<blockquote>\r\n<p>来自<a href=\"https://wanandroid.com/user/132308/articles/1\">initLiu</a>，<a href=\"https://wanandroid.com/wenda/show/8857?fid=132308&amp;date=2022_05_25_18_35_38&amp;message=Android%E4%B8%AD%E7%9A%84%E5%8C%BF#msg_id2459\">问题</a></p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22814,"link":"https://wanandroid.com/wenda/show/22814","niceDate":"2022-05-25 21:00","niceShareDate":"2022-05-25 21:00","origin":"","prefix":"","projectLink":"","publishTime":1653483633000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1653483610000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"【大家提问】Android中的匿名binder与线程相关的一些问题","type":1,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p><strong> 前提条件：</strong><br><strong>mView为VISIBLE状态</strong><br>执行：</p>\r\n<pre><code>  private fun startHideAnimation() {\r\n        mView.isVisible = false\r\n        mView.startAnimation(AlphaAnimation(1.0f else 0.0f).apply {\r\n            //如果将fillAfter设置为true,即使为gone,也能接收到事件,分析下为啥?\r\n            //            fillAfter = true\r\n            duration = 250\r\n        })\r\n    }\r\n</code></pre><p><strong>现象：</strong><br>view会先执行完动画完后才GONE<br><strong>问题：</strong><br>查看源码：<br><code>view.isVisible = GONE</code> 会经历下面的流程</p>\r\n<pre><code>public void setVisibility(@Visibility int visibility) {\r\n        setFlags(visibility, VISIBILITY_MASK);\r\n    }\r\n\r\n\r\nvoid setFlags(int flags, int mask) {\r\n            //忽略部分代码\r\n\r\n            if ((changed &amp; GONE) != 0) {\r\n                    requestLayout();\r\n\r\n                    if (mParent instanceof View) {\r\n                            // GONE views noop invalidation, so invalidate the parent\r\n                            ((View) mParent).invalidate(true);\r\n          }\r\n            }\r\n}\r\n</code></pre><p><code>startAnimation</code>会经历下面的流程：</p>\r\n<pre><code>public void setAnimation(Animation animation) {\r\n                //忽略部分代码\r\n        mCurrentAnimation = animation;\r\n                invalidate(true)\r\n}\r\n</code></pre><p>而动画执行的时机是在draw()中的</p>\r\n<pre><code>applyLegacyAnimation()\r\n</code></pre><p>但此时不是已经为GONE了吗，为啥仍然能够显示并执行完动画才消失呢。<br>其实把顺序调换了，现象也是一样。感觉跟view的绘制流程有关系，但无法分析透彻，请问why？</p>\r\n<blockquote>\r\n<p>本问题由<a href=\"https://wanandroid.com/wenda/show/8857?fid=105427&amp;date=2022_05_13_12_01_32&amp;message=%20%E5%89%8D%E6%8F%90%E6%9D%A1%E4%BB%B6%EF%BC%9AmVie\">张小飞的提问</a></p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22665,"link":"https://wanandroid.com/wenda/show/22665","niceDate":"2022-05-13 21:53","niceShareDate":"2022-05-13 21:53","origin":"","prefix":"","projectLink":"","publishTime":1652450008000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1652449986000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"【大家提问】为什么View.GONE效果不优先生效呢？","type":1,"userId":2,"visible":1,"zan":3},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>更近一直关注合规问题，其中有一次被检测到风险是：</p>\r\n<p>在Google的pixel设备中，某个进程被杀死后，然后又自动被「拉活」了，排查发现可能是各种注册的Service因为其onStartCommand返回START_STICKY导致。</p>\r\n<p>那么问题来了：</p>\r\n<ol>\r\n<li>当Service onStartCommand返回START_STICKY后，进程被杀系统是如何「复活」所在进程的？</li>\r\n<li>面对项目中一堆Service可能返回START_STICKY，如何可以在原生系统上避免被「拉活」？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22539,"link":"https://wanandroid.com/wenda/show/22539","niceDate":"2022-04-27 11:39","niceShareDate":"2022-04-27 11:39","origin":"","prefix":"","projectLink":"","publishTime":1651030789000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1651030758000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Service onStartCommand 返回STICKY是如何做到被拉活的？","type":1,"userId":2,"visible":1,"zan":3},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>在我们日常开发过程中，可能会遇到一类比较难搞的crash：<code>java.lang.VerifyError</code>，问题来了：</p>\r\n<ol>\r\n<li>哪些情况可能会导致运行时发生VerifyError？</li>\r\n<li>如何前置发现相关问题，而不必等到运行到相关代码导致应用崩溃；</li>\r\n<li>【引申问题】对于verify还有一类为dex2oat阶段verify failed，需要运行时额外在做一次classverify，可能会导致一定的性能损耗，对此情况如何避免？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22606,"link":"https://wanandroid.com/wenda/show/22606","niceDate":"2022-05-27 20:55","niceShareDate":"2022-05-06 11:35","origin":"","prefix":"","projectLink":"","publishTime":1653656113000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1651808113000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问| 如何前置发现VerifyError相关问题？","type":0,"userId":2,"visible":0,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>前两天看公众号文章：<br><a href=\"https://mp.weixin.qq.com/s/XHbJ1L5_rdvKs3AjLCvGiA\">分享一个困惑很久的问题：App前台，Activity会被回收吗？</a></p>\r\n<p>文章中源码分析阶段，看到了一些核心类：</p>\r\n<pre><code> ActivityRecord、TaskRecord、ActivityStack、ActivityDisplay、ActivityStackSupervisor\r\n</code></pre><p>绕起来有点晕。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>这些类分别起到什么作用？</li>\r\n<li>有什么好的方式帮助记忆吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":21681,"link":"https://wanandroid.com/wenda/show/21681","niceDate":"2022-05-06 11:37","niceShareDate":"2022-03-07 21:24","origin":"","prefix":"","projectLink":"","publishTime":1651808232000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1646659440000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | ActivityRecord、TaskRecord、ActivityStack、ActivityDisplay、ActivityStackSupervisor 分别是干什么的？","type":0,"userId":2,"visible":1,"zan":12},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>有时候我们会通过adb shell查看安装的debug的包一些资源信息，例如查看：</p>\r\n<pre><code>/proc/pid/fd\r\n</code></pre><p>该目录下包含该进程运行是所有打开的fd相关信息。</p>\r\n<p>如果我们直接adb shell，然后 cd /proc/pid/fd，你会发现会<code>Permission denied</code>。</p>\r\n<p>这个时候我们可以选择执行：</p>\r\n<pre><code>run-as 包名\r\ncd /proc/pid/fd\r\n</code></pre><p>就可以了。</p>\r\n<p>问题来了：<strong>run-as背后做了什么？</strong></p>\r\n<blockquote>\r\n<p>以后至少每周更新一篇。</p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":22438,"link":"https://wanandroid.com/wenda/show/22438","niceDate":"2022-05-06 11:37","niceShareDate":"2022-04-15 21:11","origin":"","prefix":"","projectLink":"","publishTime":1651808228000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1650028301000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问  | run-as 背后做了什么？","type":0,"userId":2,"visible":1,"zan":4},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>正在我们在开发的时候，涉及到需要跨进程通信，尤其是较为复杂的，需要拿到服务端 binder 代理进行交互的方式。</p>\r\n<p>一般流程为：</p>\r\n<ol>\r\n<li>编写 aidl 文件；</li>\r\n<li>实现一个 Service 子类(独立进程)，复写 onBind 方法，返回 Binder&#39;s Stub；</li>\r\n<li>主进程通过调用 bindService，间接拿到 binder 驱动，然后实现 binder 通信；</li>\r\n</ol>\r\n<p>更进一步的说，很多时候，我们也可以不依赖 aidl 文件，自己去实现Stub、Proxy类，利用 binder 驱动通过 transact 方法与服务端 Stub onTransact 进行跨进程交互。</p>\r\n<p>但是依然是需要依赖 bindService 方法，去获取 binder驱动。</p>\r\n<p>可以参考：<a href=\"https://blog.csdn.net/lmj623565791/article/details/38461079/\">Android aidl Binder框架浅析</a></p>\r\n<p>不过我们今天的关注点在于：</p>\r\n<ol>\r\n<li>可以不通过 bindService ，利用别的方式来传递 “binder 驱动”来实现跨进程通信吗？</li>\r\n<li>framework 层有哪些地方使用了 1 的方式进行通信？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":21630,"link":"https://www.wanandroid.com/wenda/show/21630","niceDate":"2022-04-27 23:43","niceShareDate":"2022-03-02 00:40","origin":"","prefix":"","projectLink":"","publishTime":1651074190000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1646152857000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 可以不借助 bindService，实现跨进程 binder 通信吗？","type":0,"userId":2,"visible":1,"zan":16},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前小缘在群里问过这个问题：</p>\r\n<p><img src=\"https://wanandroid.com/blogimgs/122c7a4f-12e7-4b59-833b-0a2a1631661d.png\" alt=\"截屏2022-02-10 下午5.27.05.png\" /></p>\r\n<blockquote>\r\n<p>先不考虑其实际的使用价值，单纯从技术角度思考，其实也有场景能用上，暂时不表。</p>\r\n</blockquote>\r\n<p>我细化一下问题：</p>\r\n<p>前提类：</p>\r\n<pre><code>public class A {\r\n\r\n    private final AInner inner = new AInner();\r\n\r\n    private final class AInner {\r\n\r\n        public void b() {\r\n            Log.d(&quot;tec-hack&quot;, &quot;AInner b invoke&quot;);\r\n        }\r\n    }\r\n}\r\n</code></pre><p>注意，暂且认为该类是系统类，我们无法在编译期对齐修改。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>如何构造一个AInner的子类对象？</li>\r\n<li>完成对A的inner成员变量替换。</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":21409,"link":"https://wanandroid.com/wenda/show/21409","niceDate":"2022-04-15 21:13","niceShareDate":"2022-02-11 14:21","origin":"","prefix":"","projectLink":"","publishTime":1650028413000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1644560499000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 被声明为private final 的内部类，能生成一个子类对象吗？逆天篡改~","type":0,"userId":2,"visible":0,"zan":11},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前有聊过：<a href=\"https://www.wanandroid.com/wenda/show/18615\">每日一问 | 我们经常说到的 Android 脱糖指的是什么？</a>  已经有同学提到可能会影响到编译期间 Transform 的编写。</p>\r\n<p>今天就来详细了解下，例如比较常见的需求：</p>\r\n<p><strong>在编译期间通过字节码处理View防止重复点击</strong></p>\r\n<ol>\r\n<li>在该案例下，需要了解脱糖的时机以及流程么？</li>\r\n<li>脱糖对该案例会造成什么样的影响？</li>\r\n<li>对于导致的问题，如何处理呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20946,"link":"https://www.wanandroid.com/wenda/show/20946","niceDate":"2022-03-07 21:26","niceShareDate":"2021-12-25 18:39","origin":"","prefix":"","projectLink":"","publishTime":1646659580000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1640428781000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 脱糖对于Android 打包期间插桩的有什么影响？","type":0,"userId":2,"visible":0,"zan":1},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>在我们学习 Java类加载流程的时候，一般都会提到：</p>\r\n<p>加载 -&gt; 连接 -&gt; 初始化 三个过程。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>这三个过程中每个环节主要做哪些事？</li>\r\n<li>.class vs Class.forName() vs loadClass()  这三者有什么不同？可以结合三个过程来描述</li>\r\n<li>Android 中类加载有个 verify class的过程上述哪个流程会触发？什么情况下会出现 verify class error 情况？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":21251,"link":"https://www.wanandroid.com/wenda/show/21251","niceDate":"2022-02-11 14:22","niceShareDate":"2022-01-19 00:51","origin":"","prefix":"","projectLink":"","publishTime":1644560546000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1642524702000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 .class vs Class.forName() vs loadClass() 类加载傻傻分不清楚？","type":0,"userId":2,"visible":1,"zan":1},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>在上一问中：</p>\r\n<p><a href=\"https://wanandroid.com/wenda/show/20535\">每日一问 | android hidden api 不是禁用反射，以及如何突破，「元反射」不行了？</a></p>\r\n<p>中，我也从中学到了很多，其实我预期的答案是小缘所回来的。但是，其他同学的回答完全超出预期，尤其是这个库<a href=\"https://github.com/LSPosed/AndroidHiddenApiBypass\">https://github.com/LSPosed/AndroidHiddenApiBypass</a> 里面的 UnSafe 操作太秀了。</p>\r\n<p>刚哥也提到 stub api 的方式，也能某些情况下解决问题。</p>\r\n<p>忽然想到一个问题：</p>\r\n<p>如果一个接口是 hidden 的，我们是否可以构造出其实现类？如果可以，有几种方式呢？</p>\r\n<p>更后，我们团队一直在招人，欢迎联系<a href=\"https://wanandroid.com/blog/show/2949\">招聘要求</a></p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20867,"link":"https://www.wanandroid.com/wenda/show/20867","niceDate":"2022-02-08 23:51","niceShareDate":"2021-12-19 17:15","origin":"","prefix":"","projectLink":"","publishTime":1644335483000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1639905347000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问  | 如何构造一个 hide interface 的实现类？","type":0,"userId":2,"visible":1,"zan":2},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>出这个问题有两个原因：</p>\r\n<ol>\r\n<li>之前在公众号推文，很多同学认为android 9之后只要是反射都不被允许了，希望拨正这个观念；</li>\r\n<li>虽然已经有很多好文提到android hidden api如何突破，但是大多是都是基于android 9来测试的，实际上随着targetSDKVersion的提升，很多方案都失效了，包括「反射的反射」这个方案，所以我觉得还是可以讨论下；</li>\r\n</ol>\r\n<p>那么问题来了：</p>\r\n<ol>\r\n<li>hidden api是指不让使用反射吗？</li>\r\n<li>hidden api list在每个系统版本上，怎么知道哪些api被限制反射使用呢？</li>\r\n<li>hidden api 官方的限制思路是怎么样的？</li>\r\n<li>目前市面上突破android hidden api的方案，能够支持targetSDKVersion 提升到android 10 , 11, 12吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20535,"link":"https://wanandroid.com/wenda/show/20535","niceDate":"2022-02-08 23:51","niceShareDate":"2021-11-19 11:57","origin":"","prefix":"","projectLink":"","publishTime":1644335474000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1637294221000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | android hidden api 不是禁用反射，以及如何突破，「元反射」不行了？","type":0,"userId":2,"visible":1,"zan":21},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>Gson大家一定不陌生，在很多项目中都大规模使用。</p>\r\n<p>例如常见的：</p>\r\n<pre><code>网络请求\r\n    -&gt;返回Json数据\r\n    -&gt;Gson解析为对象\r\n    -&gt;渲染页面\r\n</code></pre><p>很多时候，历史项目包含很多Gson解析对象在UI线程的操作，或者说即使在子线程其实也会影响页面展现速度。</p>\r\n<p>大家都了解Gson对于对象的解析，如果不单独的配置TypeAdapter，那么其实内部是充满反射的。</p>\r\n<p>问题来了：</p>\r\n<p><strong>有没有什么低侵入的方案可以尽可能去除反射操作，从而提升运行效率？描述思路即可。</strong></p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":19623,"link":"https://wanandroid.com/wenda/show/19623","niceDate":"2021-12-02 00:50","niceShareDate":"2021-08-30 21:36","origin":"","prefix":"","projectLink":"","publishTime":1638377423000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1630330596000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Gson中序列化对象的操作有低侵入的优化方案吗？","type":0,"userId":2,"visible":1,"zan":9},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>今天意外在崩溃上报平台发现一个异常为UndeclaredThrowableException，看名字就比较好奇，大家可以搜索下，尝试回答：</p>\r\n<ol>\r\n<li>什么时候会抛出此异常？</li>\r\n<li>为什么[1]中重新封装为此异常抛出，这么设计的原因是？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20514,"link":"https://www.wanandroid.com/wenda/show/20514","niceDate":"2021-12-02 00:50","niceShareDate":"2021-11-17 00:56","origin":"","prefix":"","projectLink":"","publishTime":1638377410000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1637081819000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 UndeclaredThrowableException 是什么异常？","type":0,"userId":2,"visible":1,"zan":2},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>问题如题：</p>\r\n<p>ViewGroup 的 measureChild 方法和 measureChildWithMargins 方法的区别是什么，如何在实际开发中决定选择使用哪一个？</p>\r\n<p>来源：<a href=\"https://wanandroid.com/wenda/show/8857?fid=833&amp;date=2021_10_12_09_13_15&amp;message=ViewGroup#msg_id2204\">可以从这里提问</a>，欢迎大家踊跃提问~</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":20130,"link":"https://wanandroid.com/wenda/show/20130","niceDate":"2021-12-02 00:50","niceShareDate":"2021-10-12 20:20","origin":"","prefix":"","projectLink":"","publishTime":1638377400000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1634041255000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"【大家提问】 | ViewGroup 的 measureChild 方法和 measureChildWithMargins 方法的区别是什么？","type":0,"userId":2,"visible":1,"zan":9},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":true,"courseId":13,"desc":"<p>关于 Activity 重建，我们探究几个问题：</p>\r\n<ol>\r\n<li>当前 app 正在前台运行，不在栈顶的 Activity 有可能会因为系统资源，例如内存等不足回收吗？</li>\r\n<li>当 app 处于后台运行，app 进程未被杀死，其内部的 Activity 会被回收吗？</li>\r\n<li>当 app 处于后台运行，app 的进程会被杀死吗？</li>\r\n</ol>\r\n<p>如果有能力，建议解释过程中可以配合源码，不一定要全部答出来~</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18965,"link":"https://www.wanandroid.com/wenda/show/18965","niceDate":"2021-08-30 21:37","niceShareDate":"2021-07-15 00:27","origin":"","prefix":"","projectLink":"","publishTime":1630330636000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1626280047000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 关于 Activity 重建，值得探究的几个问题","type":0,"userId":2,"visible":1,"zan":19},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>了解应用启动相关代码的同学一定知道：</p>\r\n<p>我们的应用启动时，每个进程会对应一个ActivityThread对象，而Application对象在正常情况下也是每个进程只有一个？</p>\r\n<p>但是如果你看ActivityThread的源码，你会发现：</p>\r\n<pre><code>public final class ActivityThread {\r\n    final ArrayList&lt;Application&gt; mAllApplications\r\n                = new ArrayList&lt;Application&gt;();\r\n    ...\r\n}\r\n</code></pre><p><a href=\"https://cs.android.com/android/platform/superproject/+/master:frameworks/base/core/java/android/app/ActivityThread.java;l=237?q=ActivitYtHREAD&amp;sq=&amp;ss=android%2Fplatform%2Fsuperproject\">源码直达</a></p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>什么情况下一个ActivityThread对象，会对应多个Application对象，即mAllApplications.size() &gt; 1；</li>\r\n<li>如果找到了1的情况，支持这个目的是？</li>\r\n</ol>\r\n<blockquote>\r\n<p>本问题归因为好奇，硬说使用场景在一些插件化中会尝试构造Application会调用这个，但是这个肯定不是google的本意。</p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":19550,"link":"https://wanandroid.com/wenda/show/19550","niceDate":"2021-08-30 21:36","niceShareDate":"2021-08-25 18:10","origin":"","prefix":"","projectLink":"","publishTime":1630330617000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1629886237000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 好奇ActivityThread中为什么会有一个 Application的集合？","type":0,"userId":2,"visible":1,"zan":6},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>今天我们来讨论下 Jetpack 中的 ViewModel:</p>\r\n<p>大家都知道 ViewModel 有一个特点就是能够在 Activity 发生重建时做数据的恢复。</p>\r\n<p>我们就针对这个「重建」与「恢复」问一些问题：</p>\r\n<ol>\r\n<li>ViewModel 在 Activity 发生旋转等配置发生变化所导致的重建，能恢复数据吗？</li>\r\n<li>如果 1 能，尝试从源码角度分析，数据存在哪？怎么存储的？怎么读取的？</li>\r\n<li>当 Activity 切换到后台，被系统杀死（进程存活），此时回到 Activity 导致的重建，ViewModel 的数据能恢复吗？为什么？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18930,"link":"https://www.wanandroid.com/wenda/show/18930","niceDate":"2021-08-25 18:11","niceShareDate":"2021-07-11 22:05","origin":"","prefix":"","projectLink":"","publishTime":1629886294000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1626012349000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | ViewModel 在什么情况下的「销毁重建」能够对数据进行无缝恢复？","type":0,"userId":2,"visible":1,"zan":30},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":true,"courseId":13,"desc":"<p>在我们的印象里，如果构造一个 Dialog 传入一个非 Activiy 的 context，则可能会出现 bad token exception。</p>\r\n<p>今天我们就来彻底搞清楚这一块，问题来了：</p>\r\n<ol>\r\n<li>为什么传入一个非 Activity 的 context 会出现错误？</li>\r\n<li>传入的 context 一定要是 Activity 吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18281,"link":"https://www.wanandroid.com/wenda/show/18281","niceDate":"2021-07-11 22:06","niceShareDate":"2021-05-13 00:20","origin":"","prefix":"","projectLink":"","publishTime":1626012414000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1620836414000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Dialog 的构造方法的 context 必须传入 Activity吗？","type":0,"userId":2,"visible":1,"zan":23},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>更近一直在补一些 C/C++的知识，导致 Android 相关知识看的少了，导致每日一问憋半天憋不出来。</p>\r\n<p>还好，我又更新了...</p>\r\n<p>之前公众号推文的时候，推送到混淆的时候，经常会说到「脱糖」，也有同学在留言区问什么是脱糖呀？</p>\r\n<p>今天的问题就是为了带大家彻底搞清楚什么是脱糖：</p>\r\n<ol>\r\n<li>脱糖产生的原因是什么？</li>\r\n<li>脱糖在 D8 产生后发生了什么变化？</li>\r\n<li>脱糖我们需要关注吗？在我们做什么事情的时候可能会影响到呢？</li>\r\n</ol>\r\n<p>求解答~</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18615,"link":"https://www.wanandroid.com/wenda/show/18615","niceDate":"2021-07-11 22:06","niceShareDate":"2021-06-14 22:56","origin":"","prefix":"","projectLink":"","publishTime":1626012397000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1623682607000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 我们经常说到的 Android 脱糖指的是什么？","type":0,"userId":2,"visible":1,"zan":15},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":true,"courseId":13,"desc":"<p>更近聊到一种编译优化的方案，号称秒级别：</p>\r\n<ol>\r\n<li>每次拿到修改 java 文件，编译为 class；</li>\r\n<li>将 1 中的 class 转成 dex；</li>\r\n<li>push 到 sdcard，然后重启生效；</li>\r\n</ol>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>第一步中将特定的 Java 文件转成 class 如何操作？如何极快的操作？</li>\r\n<li>如果是 kotlin 文件呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18453,"link":"https://www.wanandroid.com/wenda/show/18453","niceDate":"2021-07-11 22:06","niceShareDate":"2021-05-28 00:28","origin":"","prefix":"","projectLink":"","publishTime":1626012386000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1622132918000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 极致的编译优化如何实现？ [更新]","type":0,"userId":2,"visible":1,"zan":12},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前看文章，经常看到一些分析 Dialog、PopupWindow的文章，有些文章分析如下：</p>\r\n<p><strong>Dialog有自己独立的Window，而PopupWindow没有，所以PopupWindow可以称之为子窗口，而 Dialog不是。</strong></p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>这种说法合理吗？</li>\r\n<li>在Android中，有没有子窗口的概念呢？如果有到底应该以什么为标准呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18192,"link":"https://wanandroid.com/wenda/show/18192","niceDate":"2021-05-28 00:29","niceShareDate":"2021-05-06 00:15","origin":"","prefix":"","projectLink":"","publishTime":1622132956000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1620231346000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Android中的子窗口到底指的是什么？","type":0,"userId":2,"visible":1,"zan":16},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>对于 Intent 大家肯定都不陌生，今天我们聊一聊它的一个近亲：<strong>PendingIntent</strong></p>\r\n<p>官方对其描述为：</p>\r\n<p>A description of an Intent and target action to perform with it. </p>\r\n<p>那么问题来了：</p>\r\n<ol>\r\n<li>PendingIntent 仅仅是对 Intent 的一个封装吗？</li>\r\n<li>如果1 不是，那么为什么 PendingIntent与 Intent 有何不同，它的定位是什么样的呢？</li>\r\n<li>对于 2 的回答，如果从源码侧佐证？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18072,"link":"https://www.wanandroid.com/wenda/show/18072","niceDate":"2021-05-28 00:29","niceShareDate":"2021-04-24 22:58","origin":"","prefix":"","projectLink":"","publishTime":1622132946000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1619276317000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 已经有了 Intent，那为啥还要 PendingIntent?","type":0,"userId":2,"visible":1,"zan":8}]
/// offset : 0
/// over : false
/// pageCount : 7
/// size : 24
/// total : 159

class QuesAndAnswerDeatailBean {
  QuesAndAnswerDeatailBean({
    int curPage,
    List<QuesAndAnsewerDetails> datas,
    int offset,
    bool over,
    int pageCount,
    int size,
    int total,
  }) {
    _curPage = curPage;
    _datas = datas;
    _offset = offset;
    _over = over;
    _pageCount = pageCount;
    _size = size;
    _total = total;
  }

  QuesAndAnswerDeatailBean.fromJson(dynamic json) {
    _curPage = json['curPage'];
    if (json['datas'] != null) {
      _datas = [];
      json['datas'].forEach((v) {
        _datas.add(QuesAndAnsewerDetails.fromJson(v));
      });
    }
    _offset = json['offset'];
    _over = json['over'];
    _pageCount = json['pageCount'];
    _size = json['size'];
    _total = json['total'];
  }

  int _curPage;
  List<QuesAndAnsewerDetails> _datas;
  int _offset;
  bool _over;
  int _pageCount;
  int _size;
  int _total;

  QuesAndAnswerDeatailBean copyWith({
    int curPage,
    List<QuesAndAnsewerDetails> datas,
    int offset,
    bool over,
    int pageCount,
    int size,
    int total,
  }) =>
      QuesAndAnswerDeatailBean(
        curPage: curPage ?? _curPage,
        datas: datas ?? _datas,
        offset: offset ?? _offset,
        over: over ?? _over,
        pageCount: pageCount ?? _pageCount,
        size: size ?? _size,
        total: total ?? _total,
      );

  int get curPage => _curPage;

  List<QuesAndAnsewerDetails> get datas => _datas;

  int get offset => _offset;

  bool get over => _over;

  int get pageCount => _pageCount;

  int get size => _size;

  int get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['curPage'] = _curPage;
    if (_datas != null) {
      map['datas'] = _datas.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    map['over'] = _over;
    map['pageCount'] = _pageCount;
    map['size'] = _size;
    map['total'] = _total;
    return map;
  }
}

/// apkLink : ""
/// audit : 1
/// author : "xiaoyang"
/// canEdit : false
/// chapterId : 440
/// chapterName : "官方"
/// collect : false
/// courseId : 13
/// desc : "<p>很久前我们提问过:</p>\r\n<p><a href=\"https://www.wanandroid.com/wenda/show/8680\">每日一问 在Activity 的 onResume 方法中 view.postRunnable 能获取到 View 宽高吗？</a></p>\r\n<p>相信大家对于View.post都比较熟悉了，有个API与之非常类似：</p>\r\n<ol>\r\n<li>View.postOnAnimation 与View.post相比有什么区别？</li>\r\n<li>在什么情况下比较适合使用View.postOnAnimation呢？</li>\r\n</ol>"
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 22845
/// link : "https://wanandroid.com/wenda/show/22845"
/// niceDate : "2022-05-27 20:54"
/// niceShareDate : "2022-05-27 20:53"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1653656051000
/// realSuperChapterId : 439
/// selfVisible : 0
/// shareDate : 1653656034000
/// shareUser : ""
/// superChapterId : 440
/// superChapterName : "问答"
/// tags : [{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}]
/// title : "每日一问 View.post 又来了与View.postOnAnimation 有什么区别？"
/// type : 1
/// userId : 2
/// visible : 1
/// zan : 1

class QuesAndAnsewerDetails {
  QuesAndAnsewerDetails({
    String apkLink,
    int audit,
    String author,
    bool canEdit,
    int chapterId,
    String chapterName,
    bool collect,
    int courseId,
    String desc,
    String descMd,
    String envelopePic,
    bool fresh,
    String host,
    int id,
    String link,
    String niceDate,
    String niceShareDate,
    String origin,
    String prefix,
    String projectLink,
    int publishTime,
    int realSuperChapterId,
    int selfVisible,
    int shareDate,
    String shareUser,
    int superChapterId,
    String superChapterName,
    List<Tags> tags,
    String title,
    int type,
    int userId,
    int visible,
    int zan,
  }) {
    _apkLink = apkLink;
    _audit = audit;
    _author = author;
    _canEdit = canEdit;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _collect = collect;
    _courseId = courseId;
    _desc = desc;
    _descMd = descMd;
    _envelopePic = envelopePic;
    _fresh = fresh;
    _host = host;
    _id = id;
    _link = link;
    _niceDate = niceDate;
    _niceShareDate = niceShareDate;
    _origin = origin;
    _prefix = prefix;
    _projectLink = projectLink;
    _publishTime = publishTime;
    _realSuperChapterId = realSuperChapterId;
    _selfVisible = selfVisible;
    _shareDate = shareDate;
    _shareUser = shareUser;
    _superChapterId = superChapterId;
    _superChapterName = superChapterName;
    _tags = tags;
    _title = title;
    _type = type;
    _userId = userId;
    _visible = visible;
    _zan = zan;
  }

  QuesAndAnsewerDetails.fromJson(dynamic json) {
    _apkLink = json['apkLink'];
    _audit = json['audit'];
    _author = json['author'];
    _canEdit = json['canEdit'];
    _chapterId = json['chapterId'];
    _chapterName = json['chapterName'];
    _collect = json['collect'];
    _courseId = json['courseId'];
    _desc = json['desc'];
    _descMd = json['descMd'];
    _envelopePic = json['envelopePic'];
    _fresh = json['fresh'];
    _host = json['host'];
    _id = json['id'];
    _link = json['link'];
    _niceDate = json['niceDate'];
    _niceShareDate = json['niceShareDate'];
    _origin = json['origin'];
    _prefix = json['prefix'];
    _projectLink = json['projectLink'];
    _publishTime = json['publishTime'];
    _realSuperChapterId = json['realSuperChapterId'];
    _selfVisible = json['selfVisible'];
    _shareDate = json['shareDate'];
    _shareUser = json['shareUser'];
    _superChapterId = json['superChapterId'];
    _superChapterName = json['superChapterName'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags.add(Tags.fromJson(v));
      });
    }
    _title = json['title'];
    _type = json['type'];
    _userId = json['userId'];
    _visible = json['visible'];
    _zan = json['zan'];
  }

  String _apkLink;
  int _audit;
  String _author;
  bool _canEdit;
  int _chapterId;
  String _chapterName;
  bool _collect;
  int _courseId;
  String _desc;
  String _descMd;
  String _envelopePic;
  bool _fresh;
  String _host;
  int _id;
  String _link;
  String _niceDate;
  String _niceShareDate;
  String _origin;
  String _prefix;
  String _projectLink;
  int _publishTime;
  int _realSuperChapterId;
  int _selfVisible;
  int _shareDate;
  String _shareUser;
  int _superChapterId;
  String _superChapterName;
  List<Tags> _tags;
  String _title;
  int _type;
  int _userId;
  int _visible;
  int _zan;

  QuesAndAnsewerDetails copyWith({
    String apkLink,
    int audit,
    String author,
    bool canEdit,
    int chapterId,
    String chapterName,
    bool collect,
    int courseId,
    String desc,
    String descMd,
    String envelopePic,
    bool fresh,
    String host,
    int id,
    String link,
    String niceDate,
    String niceShareDate,
    String origin,
    String prefix,
    String projectLink,
    int publishTime,
    int realSuperChapterId,
    int selfVisible,
    int shareDate,
    String shareUser,
    int superChapterId,
    String superChapterName,
    List<Tags> tags,
    String title,
    int type,
    int userId,
    int visible,
    int zan,
  }) =>
      QuesAndAnsewerDetails(
        apkLink: apkLink ?? _apkLink,
        audit: audit ?? _audit,
        author: author ?? _author,
        canEdit: canEdit ?? _canEdit,
        chapterId: chapterId ?? _chapterId,
        chapterName: chapterName ?? _chapterName,
        collect: collect ?? _collect,
        courseId: courseId ?? _courseId,
        desc: desc ?? _desc,
        descMd: descMd ?? _descMd,
        envelopePic: envelopePic ?? _envelopePic,
        fresh: fresh ?? _fresh,
        host: host ?? _host,
        id: id ?? _id,
        link: link ?? _link,
        niceDate: niceDate ?? _niceDate,
        niceShareDate: niceShareDate ?? _niceShareDate,
        origin: origin ?? _origin,
        prefix: prefix ?? _prefix,
        projectLink: projectLink ?? _projectLink,
        publishTime: publishTime ?? _publishTime,
        realSuperChapterId: realSuperChapterId ?? _realSuperChapterId,
        selfVisible: selfVisible ?? _selfVisible,
        shareDate: shareDate ?? _shareDate,
        shareUser: shareUser ?? _shareUser,
        superChapterId: superChapterId ?? _superChapterId,
        superChapterName: superChapterName ?? _superChapterName,
        tags: tags ?? _tags,
        title: title ?? _title,
        type: type ?? _type,
        userId: userId ?? _userId,
        visible: visible ?? _visible,
        zan: zan ?? _zan,
      );

  String get apkLink => _apkLink;

  int get audit => _audit;

  String get author => _author;

  bool get canEdit => _canEdit;

  int get chapterId => _chapterId;

  String get chapterName => _chapterName;

  bool get collect => _collect;

  int get courseId => _courseId;

  String get desc => _desc;

  String get descMd => _descMd;

  String get envelopePic => _envelopePic;

  bool get fresh => _fresh;

  String get host => _host;

  int get id => _id;

  String get link => _link;

  String get niceDate => _niceDate;

  String get niceShareDate => _niceShareDate;

  String get origin => _origin;

  String get prefix => _prefix;

  String get projectLink => _projectLink;

  int get publishTime => _publishTime;

  int get realSuperChapterId => _realSuperChapterId;

  int get selfVisible => _selfVisible;

  int get shareDate => _shareDate;

  String get shareUser => _shareUser;

  int get superChapterId => _superChapterId;

  String get superChapterName => _superChapterName;

  List<Tags> get tags => _tags;

  String get title => _title;

  int get type => _type;

  int get userId => _userId;

  int get visible => _visible;

  int get zan => _zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apkLink'] = _apkLink;
    map['audit'] = _audit;
    map['author'] = _author;
    map['canEdit'] = _canEdit;
    map['chapterId'] = _chapterId;
    map['chapterName'] = _chapterName;
    map['collect'] = _collect;
    map['courseId'] = _courseId;
    map['desc'] = _desc;
    map['descMd'] = _descMd;
    map['envelopePic'] = _envelopePic;
    map['fresh'] = _fresh;
    map['host'] = _host;
    map['id'] = _id;
    map['link'] = _link;
    map['niceDate'] = _niceDate;
    map['niceShareDate'] = _niceShareDate;
    map['origin'] = _origin;
    map['prefix'] = _prefix;
    map['projectLink'] = _projectLink;
    map['publishTime'] = _publishTime;
    map['realSuperChapterId'] = _realSuperChapterId;
    map['selfVisible'] = _selfVisible;
    map['shareDate'] = _shareDate;
    map['shareUser'] = _shareUser;
    map['superChapterId'] = _superChapterId;
    map['superChapterName'] = _superChapterName;
    if (_tags != null) {
      map['tags'] = _tags.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['type'] = _type;
    map['userId'] = _userId;
    map['visible'] = _visible;
    map['zan'] = _zan;
    return map;
  }
}

/// name : "本站发布"
/// url : "/article/list/0?cid=440"

class Tags {
  Tags({
    String name,
    String url,
  }) {
    _name = name;
    _url = url;
  }

  Tags.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }

  String _name;
  String _url;

  Tags copyWith({
    String name,
    String url,
  }) =>
      Tags(
        name: name ?? _name,
        url: url ?? _url,
      );

  String get name => _name;

  String get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }
}
