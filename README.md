Example project of an `enum` that breaks the observable properties of an `ObservableObject` depending on where its defined.

For the following `enum`...
```
enum SomeEnum {
    case someCase
}
```

...this works fine...
```
class ContentViewModel: ObservableObject {

    @Published var numbers: [Int] = []
    var someEnum: SomeEnum = .someCase

    func onAppear() {
        numbers = Array(0...9)
    }

}
```

...but this doesn't.
```
class ContentViewModel: ObservableObject {

    var someEnum: SomeEnum = .someCase
    @Published var numbers: [Int] = []

    func onAppear() {
        numbers = Array(0...9)
    }

}
```
