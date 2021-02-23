#lang scribble/manual

@title{Understanding reader and writer}
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