# MD5-WASM

MD5-WASM is a *fast* asynchronous MD5 calculator, optimized for large files.&nbsp;
It is called using a Promise-style syntax, with 'then' and 'catch'.&nbsp;
WebAssembly is seamlessly used to calculate MD5 values for files above a certain size threshold.

### Highlights

&#9679; 30x faster than the most popular MD5 utility&nbsp;   
&#9679; Server-side (NodeJS) or client-side (browser)&nbsp;   
&#9679; Non-blocking, uses Promise syntax&nbsp;   

## Raison d'être &nbsp; (Reason for being)

### Faster and non-blocking

Our MD5 hashing was initially performed using this wonderfully simple utility:&nbsp; 
https://www.npmjs.com/package/md5&nbsp;&nbsp;
However, it is synchronous, blocking code execution, and slow &mdash; impractically slow for video files.&nbsp; 
(On our low-powered server platform, we clock it as approaching 1 second per megabyte.)&nbsp; 

### 30x faster?

Yep, here are the benchmarks, run on our (slow) production server platform using NodeJS on Ubuntu.&nbsp; 

	                      ELAPSED MILLISECONDS            MEGABYTES PER SECOND
	                     MD5           MD5-WASM          MD5           MD5-WASM
	 2 Mbytes           2,100             330            0.95              6            
	 4 Mbytes           4,000             330            1.00             12
	 8 Mbytes           7,600             400            1.05             20
	12 Mbytes          12,400             523            0.96             23
	24 Mbytes          22,600             800            1.06             30
	37 Mbytes          38,480           1,080            0.96             34

### Why the *huge* improvement?

It would not be surprising to see a 3x improvement up to 5x improvement from WebAssembly but 30x is definitely surprising.&nbsp; 
Here is a factor; JavaScript does a lot more work than WebAssembly &mdash; *billions* of number format conversions for a 50M file.&nbsp; 

JavaScript runs native with 64-bit floating point numbers but all bitwise operations are done with 32-bit integers.&nbsp;
MD5 calculation is _all_ bitwise operations.&nbsp; 
JavaScript is constantly converting floating point to integers, performing an operation, and then converting them back.&nbsp; 
WebAssembly does not carry that extra burden and is intrinsically faster.

### Is there a downside?

You need do nothing different to accomodate WebAssembly &mdash; MD5 WASM loads in a browser or Node environment exactly like a pure JavaScript utility would.&nbsp; 
Unlike MD5, MD5-WASM does not take parameters in a string format.&nbsp; 
There is no synchronous version; you must use a promise instead of a simple blocking function call.&nbsp; 

## Javascript Calls And Parameters

### Usage example

	data      = largeArrayBufferFromSomewhere;              // Get the data any which way you can

	md5WASM(data)                                           // Our function
	    .then(function(hash){ console.log(hash) })
	    .catch(function(err){ console.log(err) })

## Loading MD5-WASM

At less than 32K, the code file does not justify minification.&nbsp;
It is all-inclusive and has no external dependencies.&nbsp;

### HTML tag

	<script type="text/javascript" src="path/md5-wasm.js"></script>

You will find the function at *window.md5WASM*

### In NodeJS

	md5WASM      = require("md5-wasm");

