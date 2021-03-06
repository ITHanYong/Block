# Block
代码块

Block：带有自动变量的匿名函数。
匿名函数：没有函数名的函数，一对{}包裹的内容是匿名函数的作用域。
自动变量：栈上声明的一个变量不是静态变量和全局变量，是不可以在这个栈内声明的匿名函数中使用的，但在Block中却可以。
虽然使用Block不用声明类，但是Block提供了类似Objective-C的类一样可以通过成员变量来保存作用域外变量值的方法，那些在Block的一对{}里使用到但却是在{}作用域以外声明的变量，就是Block截获的自动变量。


Block的循环引用原理和解决方法大家都比较熟悉，此处将结合上文的介绍，介绍一种不常用的解决Block循环引用的方法和一种借助Block参数解决该问题的方法。
Block循环引用原因：一个对象A有Block类型的属性，从而持有这个Block，如果Block的代码块中使用到这个对象A，或者仅仅是用用到A对象的属性，会使Block也持有A对象，导致两者互相持有，不能在作用域结束后正常释放。
解决原理：对象A照常持有Block，但Block不能强引用持有对象A以打破循环。
解决方法：
方法一： 对Block内要使用的对象A使用_*_weak*进行修饰，Block对对象A弱引用打破循环。

有三种常用形式：
使用__weak ClassName
使用__weak typeof(self)
Reactive Cocoa中的@weakify和@strongify

方法二：对Block内要使用的对象A使用__block进行修饰，并在代码块内，使用完__block变量后将其设为nil，并且该block必须至少执行一次。

