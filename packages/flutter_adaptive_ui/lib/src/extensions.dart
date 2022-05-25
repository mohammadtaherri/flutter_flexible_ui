part of flutter_adaptive_ui;

/// Extension methods to get the current breakpoint to a BuildContext.
extension BreakpointX on BuildContext {
  /// Get the current [BreakpointData]. This is a shortcut for `Breakpoint.of(context)`.
  BreakpointData breakPoint() => Breakpoint.of(this);

  /// Get the current [BreakpointData?]. This is a shortcut for `Breakpoint.maybeOf(context)`.
  BreakpointData? maybeBreakPoint() => Breakpoint.maybeOf(this);
}
