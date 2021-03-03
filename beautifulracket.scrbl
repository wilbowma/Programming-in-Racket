#lang scribble/manual

@title{Designing a Language in Racket}

@section[#:tag "dsl"]{Designing a programming language"}

Some thoughts about this, the core thing involved in designing a 
domain specific programming language involve the following:
design new notation and behaviour for a programming language, 
write the racket program that takes source code in new language and 
converts it into equivalent program, finally, run the racket program. 

It's all about perspective and the way we are actually looking at this. 
If we logically think about it, the source code is nothing but code
being written in racket. 
We are basically writing code in Racket that compiles to Racket which 
then runs normally. 
This is quite cool.
Making a transcompiler is the key in the process of creating a new
application. 



--------
There is the reader and the expander. 

Reader is what converts the syntax into s-expressions which is
the default way racket interprets syntax. 
Now though based on the video I watched, they are planning to replace
the s-expressions to make it more accessible for "real" sort of languages
apparently. 

The expander is the way we can interpret the syntax of that language and 
give it meaning. 

---
The reader: the main goal is to create modules within this.
This newly created module is packaged as a syntax object.
(A little digression into what a syntax object is: )

Racket will replace the original source code with the module 
that we are creating as a syntax object. 

Now this module invokes the expander which is what triggers the full
expansion of the module. 
Expansion of the module to what? 


----
Racket abstractions
There are modules, 
Each module can contain submodules

Each module consists of multiple functions (?)
within itself.

---
