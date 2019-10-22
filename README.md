# SwiftAsyncOperation

Swift asynchronous operation is a take on Operation class. This class adds methods to streamline the creation of typical asychronous operation and marks the operation as ready as soon as the `init()` call returns. Overrides to `init()` should call super, while subclass can create custom initializer to configure variables as needed.
