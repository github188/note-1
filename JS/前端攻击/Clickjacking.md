“Clickjacking（点击劫持）是由互联网安全专家罗伯特·汉森和耶利米·格劳斯曼在2008年提出的。

是一种视觉欺骗手段，在web端就是iframe嵌套一个透明不可见的页面，让用户在不知情的情况下，点击攻击者想要欺骗用户点击的位置。”

假设你访问一个web站点并看到如下的页面：



免费的午餐谁都喜欢，当你满怀期待的点击按钮“WIN”的时候，恭喜你，你已经被点击劫持了。你实际点击的链接如下：



这是登录网上银行之后的一个转账链接，转移你的全部资产给Kim Dotcom先生。但是你根本你没有看到这个页面，像做梦一样。这只是一个简单的示例，实现上在网上银行转账不会这么简单，但是却告诉我们一个道理，访问网页和看魔术表演一样，看到的不一定都是真的。

下面我们具体讨论下点击劫持的内部机制，和防御措施。

1.1点击劫持（CLICKJACKING ATTACKS）
点击劫持的表象一般是用户点击了页面的A元素，但是实际上接收点击事件的却是另外一个元素。

现在改变下页面内个元素的透明度，再来看下刚才的页面。



我们可以看到，在ipad页面是上部还有个层，实际上是一个iframe，现在的透明度为50%，实际的页面中它的透明度为0%，虽然被隐藏不可见，但是随时都可以被激活。

在 Firefox的3D视图下，观察这个页面更明显。



被隐藏的iframe在IPAD页面的上部，同时转款的链接正好在“WIN”的上方，因为设置了透明度，用户只能看到“WIN”，但实际点击的是转款。

攻击者的页面内容可能是这样的：

<div style="position: absolute; left: 10px; top: 10px;">Hey - we're giving away iPad minis!!! Just click the WIN button and it's yours!!!</div>

<div style="position: absolute; left: 200px; top: 50px;">

  <img src="http://images.apple.com/my/ipad-mini/overview/images/hero.jpg" width="250">
</div>

<div style="position: absolute; left: 10px; top: 101px; color: red; font-weight: bold;">>> WIN <<</div>

<iframe style="opacity: 0;" height="545" width="680" scrolling="no" src="http://mybank/Transfer.aspx"></iframe>

代码就是这么简单，下面我们观察一下点击“WIN”时实际上点击“转款”链接时的http请求信息。



从图中标记的地方，可以看到请求的实际地址和身份验证的cookie信息。当然这样的攻击能成功，在于用户已经登录的网上银行。这样的攻击行为和跨站请求伪造很类似。

下面我们讨论下针对点击劫持的基本防御方法。