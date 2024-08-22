local version = "@project-version@"
local versionObj = {}

for w in string.gmatch(version, "[0-9]*") do
    if w ~= "" then 
        table.insert(versionObj, w)
    end
end

if #versionObj == 0 then
    versionObj = {1, 1}
end

local LibLodash = LibStub:NewLibrary("LibLodash-" .. versionObj[1], versionObj[2])

if not LibLodash then
   return	-- already loaded and no upgrade necessary
end

---
-- lodash for lua https://github.com/axmat/lodash.lua
-- @module lodash
-- @author Daniel Moghimi (daniel.mogimi@gmail.com)
-- @license MIT

local a={_VERSION='0.02'}if type(table.pack)~='function'then function table.pack(...)return{n=select("#",...),...}end end;if type(table.unpack)~='function'then table.unpack=unpack end;a.chunk=function(b,c)local d={}local c=c==0 and 1 or c or 1;local e,f=1,1;while true do d[f]={}for g=1,c do a.push(d[f],b[e])e=e+1 end;if a.gt(e,#b)then break end;f=f+1 end;return d end;a.compact=function(b)local d={}for h,i in pairs(b)do if i then a.push(d,i)end end;return d end;a.difference=function(b,...)local d={}local e=1;local j=a.table(...)for h,i in ipairs(b)do local k=false;while not a.isNil(j[e])do for g,l in ipairs(j[e])do if i==l then k=true;break end end;e=e+1 end;if not k then a.push(d,i)end;e=1 end;return d end;a.drop=function(b,m)local m=m or 1;return a.slice(b,m+1)end;local n=function(o,p,...)local q;local o=o or a.identity;if p then q=o(p,...)else q=o(...)end;return q end;a.dropRight=function(b,m)local m=m or 1;return a.slice(b,nil,#b-m)end;local r=function(b,o,p,s,t,u)local d={}local e=s;while not a.isNil(b[e])do if#d==0 and n(o,p,b[e],e,b)then e=e+t else if u then a.enqueue(d,b[e])else a.push(d,b[e])end;e=e+t end end;return d end;a.dropRightWhile=function(b,o,p)return r(b,o,p,#b,-1,true)end;a.dropWhile=function(b,o,p)return r(b,o,p,1,1)end;a.enqueue=function(b,v)return table.insert(b,1,v)end;a.fill=function(b,v,s,w)local s=s or 1;local w=w or#b;for f=s,w,s>w and-1 or 1 do b[f]=v end;return b end;local x=function(b,o,p,s,t)local e=s;while not a.isNil(b[e])do if n(o,p,b[e],e,b)then return e end;e=e+t end;return-1 end;a.findIndex=function(b,o,p)return x(b,o,p,1,1)end;a.findLastIndex=function(b,o,p)return x(b,o,p,#b,-1)end;a.first=function(b)return b[1]end;a.flatten=function(b,y)local d={}for h,i in ipairs(b)do if a.isTable(i)then local z;if y then z=a.flatten(i)else z=i end;for A,l in ipairs(z)do a.push(d,l)end else a.push(d,i)end end;return d end;a.flattenDeep=function(b)return a.flatten(b,true)end;a.indexOf=function(b,v,B)return a.findIndex(b,function(m)return m==v end)end;a.initial=function(b)return a.slice(b,nil,#b-1)end;a.intersection=function(...)local j=a.table(...)local C=table.remove(j,1)local d={}for f,i in ipairs(C)do local D=false;for E,l in ipairs(j)do if a.indexOf(l,i)==-1 then D=true;break end end;if not D then a.push(d,i)end end;return d end;a.join=function(b,F)if F==nil then F=','end;local j=a.reduce(a.initial(b),function(q,v)table.insert(q,v)table.insert(q,F)return q end,{})table.insert(j,b[#b])return table.concat(j)end;a.last=function(b)return b[#b]end;a.lastIndexOf=function(b,v,B)return a.findLastIndex(b,function(m)return m==v end)end;a.pull=function(b,...)local f=1;while not a.isNil(b[f])do local k=false;for h,i in ipairs(a.table(...))do if b[f]==i then table.remove(b,f)k=true;break end end;if not k then f=f+1 end end;return b end;a.push=function(b,v)return table.insert(b,v)end;a.pullAt=function(b,...)local d={}local j=a.table(...)table.sort(j,function(G,H)return a.gt(G,H)end)for f,I in ipairs(j)do a.enqueue(d,table.remove(b,I))end;return d end;a.remove=function(b,o)local d={}local e=1;local o=o or a.identity;while not a.isNil(b[e])do if o(b[e],e,b)then a.push(d,table.remove(b,e))else e=e+1 end end;return d end;a.rest=function(b)return a.slice(b,2,#b)end;a.tail=a.rest;a.reverse=function(b)local d={}for f,i in ipairs(b)do a.enqueue(d,i)end;return d end;a.slice=function(b,s,w)local s=s or 1;local w=w or#b;local d={}for f=s,w do d[f-s+1]=b[f]end;return d end;a.take=function(b,m)local m=m or 1;return a.slice(b,1,m)end;a.takeRight=function(b,m)local m=m or 1;return a.slice(b,#b-m+1)end;local J=function(b,o,p,s,t,u)local d={}local e=s;while not a.isNil(b[e])do if n(o,p,b[e],e,b)then if u then a.enqueue(d,b[e])else a.push(d,b[e])end else break end;e=e+t end;return d end;a.takeRightWhile=function(b,o,p)return J(b,o,p,#b,-1,true)end;a.union=function(...)local j=a.table(...)local d={}for f,b in ipairs(j)do for E,i in ipairs(b)do if a.indexOf(d,i)==-1 then a.push(d,i)end end end;return d end;a.takeWhile=function(b,o,p)return J(b,o,p,1,1)end;a.uniq=function(b,K,p)local d={}local L={}for h,i in ipairs(b)do local M=n(K,p,i,h,b)if a.indexOf(L,M)==-1 then a.push(d,i)end;a.push(L,M)end;return d end;a.zipObject=function(...)local j=a.table(...)local d={}if#j==1 then for f,N in ipairs(j[1])do d[N[1]]=N[2]end else for f=1,#j[1]do d[j[1][f]]=j[2][f]end end;return d end;a.unzip=function(b)return a.zip(a.args(b))end;a.without=function(b,...)local d={}for f,i in ipairs(b)do local O=a.table(...)if a.indexOf(O,i)==-1 then a.push(d,i)end end;return d end;a.zip=function(...)local d={}for f,b in ipairs(a.table(...))do for g,i in ipairs(b)do d[g]=d[g]or{}d[g][f]=i end end;return d end;a.at=function(P,...)local d={}for h,Q in ipairs(a.table(...))do if a.isTable(Q)then for h,Q in ipairs(Q)do a.push(d,P[Q])end else a.push(d,P[Q])end end;return d end;a.countBy=function(P,K,p)local d={}for h,i in a.iter(P)do local M=a.str(n(K,p,i,h,P))if a.isNil(d[M])then d[M]=1 else d[M]=d[M]+1 end end;return d end;a.groupBy=function(P,K,p)local d={}for h,i in a.iter(P)do local M=n(K,p,i,h,P)if a.isNil(d[M])then d[M]={i}else a.push(d[M],i)end end;return d end;a.indexBy=function(P,K,p)local d={}for h,i in a.iter(P)do local M=a.str(n(K,p,i,h,P))d[M]=i end;return d end;a.every=function(P,o,p)for h,i in a.iter(P)do if not n(o,p,i,h,P)then return false end end;return true end;local R=function(P,o,p,S)local d={}setmetatable(d,{__index=a})for h,i in a.iter(P)do local T=n(o,p,i,h,P)if S then if not T then a.push(d,i)end else if T then a.push(d,i)end end end;return d end;a.filter=function(P,o,p)return R(P,o,p)end;a.forEach=function(P,o,p)for h,i in a.iter(P)do n(o,p,i,h,P)end;return P end;a.forEachRight=function(P,o,p)for h,i in a.iterRight(P)do n(o,p,i,h,P)end;return P end;a.includes=function(P,U)local q=a.find(P,function(m)return m==U end)return q~=nil end;a.invoke=function(P,V,...)local d={}for h,i in a.iter(P)do a.push(d,n(V,i,...))end;return d end;a.map=function(P,K,p)local d={}setmetatable(d,{__index=a})for h,i in a.iter(P)do d[h]=n(K,p,i,h,P)end;return d end;a.partition=function(P,o,p)local d={{},{}}for h,i in a.iter(P)do if n(o,p,i,h,P)then a.push(d[1],i)else a.push(d[2],i)end end;return d end;a.pluck=function(P,W)local d={}for h,v in a.iter(P)do a.push(d,a.get(v,W))end;return d end;a.reduce=function(P,K,X,p)local X=X;for h,i in a.iter(P)do if a.isNil(X)then X=i else X=n(K,p,X,i,h,P)end end;return X end;a.reduceRight=function(P,K,X,p)local X=X;for h,i in a.iterRight(P)do if a.isNil(X)then X=i else X=n(K,p,X,i,h,P)end end;return X end;a.reject=function(P,o,p)return R(P,o,p,true)end;a.sample=function(P,m)local m=m or 1;local d={}local Y=a.keys(P)for f=1,m do local Z=Y[a.random(1,#Y)]a.push(d,a.get(P,{Z}))end;return#d==1 and d[1]or d end;a.size=function(P)local e=0;for h,i in a.iter(P)do e=e+1 end;return e end;a.some=function(P,o,p)for h,i in a.iter(P)do if n(o,p,i,h,P)then return true end end;return false end;a.sortBy=function(P,o,p)local d={}local _=true;local a0;for h,i in a.iter(P)do if _ then a.push(d,i)a0=n(o,p,i,h,P)_=false else local M=n(o,p,i,h,P)if a.lt(a0,M)then table.insert(d,i)a0=M else table.insert(d,#d,i)end end end;return d end;a.find=function(P,o,p)for h,i in a.iter(P)do if n(o,p,i,h,P)then return i end end end;a.findLast=function(P,o,p)for h,i in a.iterRight(P)do if n(o,p,i,h,P)then return i end end end;a.after=function(m,a1)local f=1;return function(...)if a.gt(f,m)then return a1(...)end;f=f+1 end end;a.ary=function(a1,m)return function(...)if m==1 then return a1(...)else local d=a.table(...)local C=a.take(d,m)return a1(a.args(C))end end end;a.before=function(m,a1)local f=1;local q;return function(...)if a.lte(f,m)then q=a1(...)end;f=f+1;return q end end;a.modArgs=function(a1,...)local a2={}for f,i in ipairs(a.table(...))do if a.isFunction(i)then a.push(a2,i)elseif a.isTable(i)then for A,l in a.iter(i)do if a.isFunction(l)then a.push(a2,l)end end end end;return function(...)local O;for f,a3 in ipairs(a2)do if a.isNil(O)then O=a.table(a3(...))else O=a.table(a3(a.args(O)))end end;if a.isNil(O)then return a1(...)else return a1(a.args(O))end end end;a.negate=function(a1)return function(...)return not a1(...)end end;a.once=function(a1)local a4=false;local q;return function(...)if not a4 then q=a1(...)a4=true end;return q end end;a.rearg=function(a1,...)local a5={}for f,i in ipairs(a.table(...))do if a.isNumber(i)then a.push(a5,i)elseif a.isTable(i)then for A,l in a.iter(i)do if a.isNumber(l)then a.push(a5,l)end end end end;return function(...)local O=a.table(...)local a6={}for f,I in ipairs(a5)do a.push(a6,O[I])end;if#a5==0 then return a1(...)else return a1(a.args(a6))end end end;a.args=function(v)if a.isTable(v)then return table.unpack(v)else return table.unpack({v})end end;a.gt=function(v,a7,...)local v,a7=a.cast(v,a7)if a.isString(v)or a.isNumber(v)then return v>a7 elseif a.isFunction(v)then return v(...)>a7(...)end;return false end;a.gte=function(v,a7,...)if a.isNil(v)or a.isBoolean(v)then return v==a7 end;local v,a7=a.cast(v,a7)if a.isString(v)or a.isNumber(v)then return v>=a7 elseif a.isFunction(v)then return v(...)>=a7(...)elseif a.isTable(v)then return false end;return false end;a.isBoolean=function(v)return type(v)=='boolean'end;a.isEmpty=function(v)if a.isString(v)then return#v==0 elseif a.isTable(v)then local f=0;for h,i in a.iter(v)do f=f+1 end;return f==0 else return true end end;a.isFunction=function(v)return type(v)=='function'end;a.isNil=function(v)return type(v)=='nil'end;a.isNumber=function(v)return type(v)=='number'end;a.isString=function(v)return type(v)=='string'end;a.isTable=function(v)return type(v)=='table'end;a.lt=function(v,a7,...)local v,a7=a.cast(v,a7)if a.isString(v)or a.isNumber(v)then return v<a7 elseif a.isFunction(v)then return v(...)<a7(...)end;return false end;a.lte=function(v,a7,...)if a.isNil(v)or a.isBoolean(v)then return v==a7 end;local v,a7=a.cast(v,a7)if a.isString(v)or a.isNumber(v)then return v<=a7 elseif a.isFunction(v)then return v(...)<=a7(...)elseif a.isTable(v)then return false end;return false end;a.cast=function(G,H)if type(G)==type(H)then return G,H end;local a8;if a.isString(G)then a8=a.str elseif a.isBoolean(G)then a8=a.bool elseif a.isNumber(G)then a8=a.num elseif a.isFunction(G)then a8=a.func elseif a.isTable(G)then a8=a.table end;return G,a8(H)end;a.func=function(...)local d=a.table(...)return function()return a.args(d)end end;a.table=function(...)return table.pack(...)end;a.bool=function(v,...)local a9=false;if a.isString(v)then a9=#v>0 elseif a.isBoolean(v)then a9=v elseif a.isNumber(v)then a9=v~=0 elseif a.isFunction(v)then a9=a.bool(v(...))end;return a9 end;a.num=function(v,...)local aa=0;if a.isString(v)then ok=pcall(function()aa=v+0 end)if not ok then aa=math.huge end elseif a.isBoolean(v)then aa=v and 1 or 0 elseif a.isNumber(v)then aa=v elseif a.isFunction(v)then aa=a.num(v(...))end;return aa end;local ab=function(i)return'"'..i..'"'end;a.str=function(v,...)local ac=''if a.isString(v)then ac=v elseif a.isBoolean(v)then ac=v and'true'or'false'elseif a.isNil(v)then ac='nil'elseif a.isNumber(v)then ac=v..''elseif a.isFunction(v)then ac=a.str(v(...))elseif a.isTable(v)then ac='{'for h,i in pairs(v)do i=a.isString(i)and ab(i)or a.str(i,...)if a.isNumber(h)then ac=ac..i..', 'else ac=ac..'['..ab(h)..']='..i..', 'end end;ac=ac:sub(0,#ac-2)..'}'end;return ac end;a.inRange=function(m,s,w)local ad=a.isNil(w)and 0 or s or 0;local ae=a.isNil(w)and s or w or 1;return m>=ad and m<ae end;a.random=function(af,ag,ah)local ai=a.isNil(ag)and 0 or af or 0;local aj=a.isNil(ag)and af or ag or 1;math.randomseed(os.clock()*math.random(os.time()))local M=math.random(ai,aj)if ah then M=M+math.random()end;return M end;a.assign=function(ak,...)for I=1,select('#',...)do for h,i in pairs(select(I,...))do ak[h]=i end end;return ak end;a.get=function(ak,W,al)if a.isTable(ak)then local v=ak;local e=1;while not a.isNil(W[e])do if not a.isTable(v)then return al end;v=v[W[e]]e=e+1 end;return v or al elseif a.isString(ak)then local I=W[1]return ak:sub(I,I)end end;a.has=function(ak,W)local am=ak;local e=1;local an=true;while not a.isNil(W[e])do am=am[W[e]]if a.isNil(am)then an=false;break end;e=e+1 end;return an end;a.findKey=function(ak,o,p)for h,i in a.iter(ak)do if n(o,p,i,h,ak)then return h end end end;a.findLastKey=function(ak,o,p)for h,i in a.iterRight(ak)do if n(o,p,i,h,ak)then return h end end end;a.functions=function(ak)local d={}for h,i in a.iter(ak)do if a.isFunction(i)then a.push(d,h)end end;return d end;a.invert=function(ak,ao)local d={}for h,i in a.iter(ak)do if ao and not a.isNil(d[i])then d[i]={d[i]}a.push(d[i],h)else d[i]=h end end;return d end;local ap=function(P,aq)local ar={}for h,i in pairs(P)do table.insert(ar,h)end;if aq then table.sort(ar,a.gt)else table.sort(ar,a.lt)end;return ar end;a.keys=function(ak)if a.isTable(ak)then return ap(ak)elseif a.isString(ak)then local Y={}for f=1,#ak do Y[f]=f end;return Y end end;a.pairs=function(ak)local d={}for h,i in a.iter(ak)do a.push(d,{h,i})end;return d end;a.result=function(ak,W,al,...)local q=a.get(ak,W,al)if a.isFunction(q)then return q(...)else return q end end;a.values=function(ak)local d={}for h,i in a.iter(ak)do a.push(d,i)end;return d end;a.constant=function(v)return a.func(v)end;a.identity=function(...)return...end;local as=function(table,aq)local ar=ap(table,aq)local f=0;return function()if a.lt(f,#ar)then f=f+1;local Q=ar[f]return Q,table[Q]end end end;a.iter=function(v)if a.isString(v)then local f=0;return function()if a.lt(f,#v)then f=f+1;local e=v:sub(f,f)return f,e end end elseif a.isTable(v)then return as(v)else return function()end end end;a.iterRight=function(v)if a.isString(v)then local f=#v+1;return function()if a.gt(f,1)then f=f-1;local e=v:sub(f,f)return f,e end end elseif a.isTable(v)then return as(v,true)else return function()end end end;a.noop=function(...)return nil end;a.print=function(...)local d=a.table(...)for f,i in ipairs(d)do d[f]=a.str(d[f])end;return print(a.args(d))end;a.range=function(s,...)local s=s;local O=a.table(...)local G,H,e;if#O==0 then G=1;H=s;e=1 else G=s;H=O[1]e=O[2]or 1 end;local d={}for f=G,H,e do a.push(d,f)end;return d end;local at={}at.__index=at;function at.create()local au={}setmetatable(au,at)au.id={}return au end;function at:union(i,av)local aw=self:root(i)local ax=self:root(av)if aw~=ax then self.id[aw]=ax end end;function at:root(i)if self.id[i]==nil then self.id[i]=i end;local ay=i;while ay~=self.id[ay]do self.id[ay]=self.id[self.id[ay]]ay=self.id[ay]end;return ay end;function at:connected(i,av)return self:root(i)==self:root(av)end;a.unionFind=at




-- enhanced debug
function a.debug(...)
    --@debug@

    if a.isString(...) then
        print(GREEN_FONT_COLOR:WrapTextInColorCode("#### Debug start"))
        print(...)
        print(GREEN_FONT_COLOR:WrapTextInColorCode("#### Debug end"))
        return 
    end

    local args = {...}

    print(GREEN_FONT_COLOR:WrapTextInColorCode("#### Debug start"))

    local printObj = {}
    local devObj = {}

    a.forEach(args, function(v,k)
        if a.isTable(v) then 
        table.insert(printObj, GREEN_FONT_COLOR:WrapTextInColorCode("#".. k))
           table.insert(devObj, { position = k, obj = v})
        else
           table.insert(printObj, v)
        end
    end)


    if a.size(printObj) > 0 then 
        if a.size(printObj) ~= 1 and  a.size(printObj) ~= 1 then 
            print(table.unpack(printObj))
        end
    end

    a.forEach(devObj, function(v,k)
        if a.size(printObj) ~= 1 and  a.size(printObj) ~= 1 then 
            print(GREEN_FONT_COLOR:WrapTextInColorCode("#" .. v.position))
        end
        DevTools_Dump(v.obj)
    end)

    print(GREEN_FONT_COLOR:WrapTextInColorCode("#### Debug end"))
    --@end-debug@
end






function LibLodash:Get(method)
    return method and a[method] or a
end
