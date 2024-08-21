## Lodash for WOW
This is a simple wow Libstub wrapper around https://github.com/flowyroll/lodash.lua




#### :Get([method])

__Returns__
    The table instance of the lodash library 

__Arguments__
method
_(Optional)_ Return only the one method of the libary




### Example
```
local lodash = LibStub("LibLodash"):Get()

print(lodash.map({1, 2, 3, 4, 5, 6, 7, 8, 9}, function(n)
     return n * n
end))
```

```
local map = LibStub("LibLodash"):Get("map")

print(map({1, 2, 3, 4, 5, 6, 7, 8, 9}, function(n)
     return n * n
end))
```



Follow the [API documentation](https://moghimi.org/lodash.lua/) for the complete list.