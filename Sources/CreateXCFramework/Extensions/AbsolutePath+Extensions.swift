import TSCBasic
import ArgumentParser

extension AbsolutePath: ExpressibleByArgument {

    public init?(argument: String) {
      if let cwd = localFileSystem.currentWorkingDirectory {
        self.init(argument, relativeTo: cwd)
      } else if let path = try? AbsolutePath(validating: argument) {
        self = path
      } else {
        return nil
      }
    }

}
