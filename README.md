# #1 Todo List App
<img width="300" height="652" alt="Simulator Screenshot - iPhone 17 Pro - 2026-06-07 at 13 50 53" src="https://github.com/user-attachments/assets/a8d8b60f-8c0f-4ef0-80d1-a5f1108cb049" width="300" height="652"/>
<img width="300" height="652" alt="Simulator Screenshot - iPhone 17 Pro - 2026-06-07 at 14 19 39" src="https://github.com/user-attachments/assets/dad1692e-d278-4798-8a5c-85aeb401eebc" />

### Personal Notes from the Project
1. The preview provider structs exist for the Xcode canvas preview panel on the right side of the editor. They are just development convenience.
2. `@State` and `@StateObject` both manage states but for different types.
3. `@State` is a property wrapper designed for SwiftUI View constructs. `@State` is for simple value types like String, Bool, Int structs. It is local to the view and other views cannot directly access it. It basically asks the View to watch for the state of the value, as it might change.
4. `@StateObject` is for reference types, specifically classes that conform to `ObservableObject`.
5. `Identifiable` is a Swift protocol that requires your type to have a unique `id` property.
6. `\.self` is a key part that refers to the entire value itself rather than a property of it. It is typically used in for-each when iterating over a collection of items that are not `Identifiable`.
7. The `\.` syntax is Swift's key path, `\.title` would mean "the `title` property", `\.id` means "the `id` property" and `\.self` means "the thing itself."
8. When you import Combine and mark a property `@Published`, Combine automatically creates a publisher for that property, SwiftUI subscribes to that publisher, and whenever the value changes, SwiftUI knows to re-render any views that depend on it.
9. Codable is a protocol that makes a type automatically serializable to and from external formats like JSON. It is a type alias for the two protocols combined: Encodable and Decodable.
10. Encodable = can be converted TO data (Object → JSON)
11. Decodable = can be converted FROM data (JSON → Object)

# #2 ViewController Demo
<img width="300" height="652" alt="Simulator Screenshot - iPhone 17 Pro - 2026-06-11 at 12 31 40" src="https://github.com/user-attachments/assets/dec9609e-dae0-4eec-982d-a5676456de28" />
<img width="300" height="652" alt="Simulator Screenshot - iPhone 17 Pro - 2026-06-11 at 12 31 51" src="https://github.com/user-attachments/assets/3591a5f8-dcfc-4b98-979e-5d351f979ee0" />
<img width="300" height="652" alt="Simulator Screenshot - iPhone 17 Pro - 2026-06-11 at 12 31 58" src="https://github.com/user-attachments/assets/8e59e17a-4fa1-4761-9ca6-f06265f2b27e" />

# #3 Child View Controllers Demo
<img width="300" height="652" alt="Simulator Screenshot - iPhone 17 Pro - 2026-06-12 at 16 25 59" src="https://github.com/user-attachments/assets/6e8aa60e-99ea-4215-b7e1-544dc555bd57" />

To demonstrate two different ways to embed child View Controllers in iOS: programmatically (SecondChildVC) and via Storyboard Segue (FirstChildVC).

`ViewController` is the Parent which hosts both the child View Controllers.

`SecondChildVC` & `FirstChildVC` are the Children. Currently, they just set thw background color in `viewDidLoad`.

```
Parent viewDidLoad
    └── addSecondChildVC()
            ├── addChild()              → child moves to "pending" state
            ├── view.addSubview()       → child's view enters the window
            └── didMove(toParent:)      → child lifecycle events now fire normally
```
