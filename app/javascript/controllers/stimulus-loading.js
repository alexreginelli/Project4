import { Controller } from "@hotwired/stimulus"

export function eagerLoadControllersFrom(glob, application) {
  const context = require.context(glob, true, /\.js$/)
  context.keys().forEach((key) => {
    const controllerModule = context(key)
    const controllerName = key
      .replace(/^.*[\\/]/, "")
      .replace(/_controller\.js$/, "")
    application.register(controllerName, controllerModule.default)
  })
}