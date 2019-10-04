// module.exports = file => () => import('@/components/' + file + '.vue')
//
module.exports = file => require('@/components/' + file + '.vue')
