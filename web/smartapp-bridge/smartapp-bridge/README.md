react-проект, здесь из библиотек только smartapp-bridge из https://www.npmjs.com/package/@expressms/smartapp-bridge

в window объект добавляем bridge = WebBridge

webpack собирает все в один bundle и кладет куда нужно его
Минификация включена

node_modules не храню в проекте

Для сбоорки выполнить npm run webpack
