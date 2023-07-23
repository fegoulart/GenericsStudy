#  Generics Concepts

## Protocol Self type

Every protocol has a **Self** type that stands for the concrete conforming type 

For AnimalFeed protocol:

Self is the concrete type conforming to AnimalFeed
Self.CropType is the (concrete ?) type conforming to Crop

## Existential type

## Understand type erase

**Type erasure** is the strategy of using the same representation for different concrete types.

`var animals: [any Animal]`

Protocols with associated types interact with existential 'any' types
Type erasure replaces associated types with corresponding existential types that have equivalent constraints.

### Associated type in producing position (return type): 

```
return animals.map { animal in
    // produce method is called on an 'any Animal', so the return type is type erased returning 'any Food'
    animal.produce() // When we call a method returning an associated type on an existential type, the compiler will use type erasure to determine the result type of the call
}
```

## Hide Implementation details 

Type erasure does not allow us to work with associated types in consuming position. Instead, you must unbox the existential 'any' type by passing it to a function that takes an opaque 'some' type

An opaque result type can be used to hide the complex concrete type behind the abstract interface of a Collection.

### Associated type in consuming position (parameter type: 

```
func feedAnimals() {
    animals.map { animal in
        animal.eat(<#T##Animal.FeedType#>) // how to solve it ?
    }
}
```
### Protocols with primary associated type

Use angle brackets after the protocol name
Allows constrained opaque type `var hungryAnimals: some Collection<any Animal>`

```
protocol Collection<Element>: Sequence {
    associatedtype Element
} 

struct Array<Element>: Collection { ... }
struct Set<Element>: Collection { ... }
```
Using opaque result types to improve encapsulation by separating interface from implementation

## Identify type relationshops

Same-type requirements in protocols can model relationships between multiple different sets of concrete types

How to identify and guarantee necessary type relationships between multiple abstract types using related protocols



## References

* [Embrace Swift Generics](https://developer.apple.com/videos/play/wwdc2022/110352/)
* [Design protocol interfaces in Swift](https://developer.apple.com/videos/play/wwdc2022/110353/)
* [How and when to use Lazy Collections in Swift](https://www.avanderlee.com/swift/lazy-collections-arrays/)

