const axios = require('axios');
const db = require('../database/dbConfig.js');

module.exports = {
  add,
  find,
  findBy,
  findById,
  remove,
  update,
  raw
};

async function find(table) {
  select = 'select * from ' + table + ' order by 1'
  let r_out = await  axios.get('http://theamericanlanguage.com/notbroadway/select.php?s=' + select)
  return (r_out.data)
  // return db.raw('select * from '+view+' order by 1');
}

async function findBy(table,filter) {
  select = 'select * from ' + table + ' where ' + filter + ' limit 1'
select = percentUrl(select,true)
  console.log('findby select',select)
  let r_out = await  axios.get('http://theamericanlanguage.com/notbroadway/select.php?s=' + select)
  console.log('r_out.data',r_out.data)
  return (r_out.data[0])
  // return db.raw('select * from '+view+' order by 1');
}
async function raw(query) {
query = percentUrl(query,true)
  let r_out = await  axios.get('http://theamericanlanguage.com/notbroadway/select.php?s=' + query)
  return (r_out.data)
  // return db.raw('select * from '+view+' order by 1');
}

// function findBy(view,filter) {
//   return db(view).where(filter);
// }

async function add(table,body,c,v) {
  let valv = ''
  const vv = v
  v = percentUrl(v)
  const x = Object.keys(body)
  const y = Object.values(body)
  let xi = '(';
  x.map(makekey)
function makekey(item,ix,arr) {
if (ix === 0)
    xi = xi + arr[ix]
else
xi = xi + ',' + arr[ix]
  }
xi = xi + ')'
let yi = 'values(';
  y.map(makevalue)
function makevalue(item,ix,arr) {
  let val = percentUrl(arr[ix])
  if (ix === 0)
    yi = yi + "'" + val + "'"
else
yi = yi + ',' + "'" + val + "'"
  }
yi = yi + ')'
insert = 'insert into ' + table + xi + yi
console.log('insert',insert)
let r_out = await  axios.get('http://theamericanlanguage.com/notbroadway/raw.php?i=' + insert)
if (r_out)
{
let result = await  axios.get('http://theamericanlanguage.com/notbroadway/test.php?t=' + table + '&c=' + c + '&v=' + v)
console.log('result.data v',result.data,slashOut(v))
  if (result.data.trim() !== slashOut(vv.trim()))
return  'insert failed to get result'
}
else
return 'insert failed'
body = await  axios.get('http://theamericanlanguage.com/notbroadway/result.php?t=' + table + '&c=' + c + '&v=' + v + '&s=*')
return body.data
}

function findById(view,id) {
  return db(view)
    .where({ id })
    .first();
}

async function remove(tab,id) {
  result = await raw('select * from ' + tab + ' where id=' + id)
  await raw('delete from '+tab+' where id='+id)
  console.log('remove result',result)
  result[0].deleted = 'DELETED'
     return result[0]
    }
  
// async function update(table,id,body) {


//   await db(table).where({id: id}).update(body)
//  return  db.raw('select * from member where id='+id)   }
    
 async function update(table,id,body) {
  const k = Object.keys(body)
  const y = Object.values(body)
  let xx = '';
  y.map(makevalue)
function makevalue(item,ix,arr) {
let val = percentUrl(arr[ix])
  if (ix === 0)
    xx = xx + k[ix] + "='" + val + "'"
else
xx = xx + ',' + k[ix] + "='" + val + "'"
  }
update = 'update ' + table + ' set ' + xx +  ' where id=' + id
console.log('update',update)
let r_out = await  axios.get('http://theamericanlanguage.com/notbroadway/raw.php?i=' + update)
if (r_out)
{
  let result = await  axios.get('http://theamericanlanguage.com/notbroadway/test.php?t=' + table + '&c=id&v=' + id)
  console.log('result.data id',result.data,id)
  console.log('result.data typeof',typeof(result.data))
  console.log('id typeof',typeof(id))
  if (result.data !== Number(id))
return  'update failed to get result'
}
else
return 'update failed'
body = await  axios.get('http://theamericanlanguage.com/notbroadway/result.php?t=' + table + '&c=id&v=' + id + '&s=*')
return body.data
}

function percentUrl(v,t) {
  let valv = ''
for(let i=0;i<v.length;i++)
{
if(v[i] === "&")
valv = valv + '%26'
else if(v[i] === "!")
valv = valv + '%21'
else if(v[i] === "#")
valv = valv + '%23'
else if(v[i] === "$")
valv = valv + '%24'
else if(v[i] === "%")
valv = valv + '%25'
else if(v[i] === "'")
{
if(t)  
valv = valv + '%27'
else
valv = valv + `%5C`
valv = valv + '%27'
}
else if(v[i] === "(")
valv = valv + '%28'
else if(v[i] === ")")
valv = valv + '%29'
else if(v[i] === "*")
valv = valv + '%2A'
else if(v[i] === "+")
valv = valv + '%2B'
else if(v[i] === ",")
valv = valv + '%2C'
else if(v[i] === "/")
valv = valv + '%2F'
else if(v[i] === ":")
valv = valv + '%3A'
else if(v[i] === ";")
valv = valv + '%3B'
else if(v[i] === "=")
valv = valv + '%3D'
else if(v[i] === "?")
valv = valv + '%3F'
else if(v[i] === "@")
valv = valv + '%40'
else if(v[i] === "[")
valv = valv + '%5B'
else if(v[i] === "]")
valv = valv + '%5D'
else
  valv = valv + v[i]
  // if(v[i] === "'")
  // valv = valv + '%27'
}
return valv
}
function slashOut(v) {
  let valv = ''
for(let i=0;i<v.length;i++)
{
if(v[i] === "\\" && v[i+1] === "'" )
valv = valv
else
  valv = valv + v[i]
  // if(v[i] === "'")
  // valv = valv + '%27'
}
return valv
}
function slashIn(v) {

  while (v.includes("%27")) {
    v =  v.replace('%27', "%5C'")
  } 
return v
}
