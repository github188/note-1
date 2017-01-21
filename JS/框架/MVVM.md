#Model–view–view-model (MVVM) is a software architectural pattern.

	##Model
	
	###Model refers either to a domain model, which represents real state content (an object-oriented approach), or to the data access layer, which represents content (adata-centricapproach.[citation needed]
	
	##View
	
		###As in the MVC and MVP patterns, the view is the structure, layout, and appearance of what a user sees on the screen. [6] (UI).[further explanation needed]
		
	##View model
	
		###The view model is an abstraction of the view exposing public properties and commands. Instead of the controller of the MVC pattern, or the presenter of the MVP pattern, MVVM has a binder. In the view model, the binder mediates communication between the view and the data binder.[clarification needed] The view model has been described as a state of the data in the model.[7]
		
	##Binder
	
		###Declarative data- and command-binding are implicit in the MVVM pattern. In the Microsoft solution stack, the binder is a markup language called XAML.[8] The binder frees the developer from being obliged to write boiler-plate logic to synchronize the view model and view. When implemented outside of the Microsoft stack the presence of a declarative databinding technology is a key enabler of the pattern.[4][9][clarification needed]
		
		

#MVC相关用法思考	http://www.infoq.com/cn/articles/rethinking-mvc-mvvm
	##我们来看看 MVC 这种架构的特点。其实设计模式很多时候是为了 Don't repeat yourself 原则来做的，该原则要求能够复用的代码要尽量复用，来保证重用。在 MVC 这种设计模式中，我们发现 View 和 Model 都是符合这种原则的。

	##对于 View 来说，你如果抽象得好，那么一个 App 的动画效果可以很方便地移植到别的 App 上，而 Github 上也有很多 UI 控件，这些控件都是在 View 层做了很好的封装设计，使得它能够方便地开源给大家复用。

	##对于 Model 来说，它其实是用来存储业务的数据的，如果做得好，它也可以方便地复用。比如我当时在做有道云笔记 iPad 版的时候，我们就直接和 iOS 版复用了所有的 Model 层的代码。在创业做猿题库客户端时，iOS 和 iPad 版的 Model 层代码再次被复用上了。当然，因为和业务本身的数据意义相关，Model 层的复用大多数是在一个产品内部，不太可能像 View 层那样开源给社区。

	##说完 View 和 Model 了，那我们想想 Controller，Controller 有多少可以复用的？我们写完了一个 Controller 之后，可以很方便地复用它吗？结论是：非常难复用。在某些场景下，我们可能可以用addSubViewController 之类的方式复用 Controller，但它的复用场景还是非常非常少的。

	##如果我们能够意识到 Controller 里面的代码不便于复用，我们就能知道什么代码应该写在 Controller 里面了，那就是那些不能复用的代码。在我看来，Controller 里面就只应该存放这些不能复用的代码，这些代码包括：

	- 在初始化时，构造相应的 View 和 Model。
	- 监听 Model 层的事件，将 Model 层的数据传递到 View 层。
	- 监听 View 层的事件，并且将 View 层的事件转发到 Model 层。
	- 如果 Controller 只有以上的这些代码，那么它的逻辑将非常简单，而且也会非常短。

	- 但是，我们却很难做到这一点，因为还是有很多逻辑我们不知道写在哪里，于是就都写到了 Controller 中了，那我们接下来就看看其它逻辑应该写在哪里。