import 'action_contexts.dart';
import 'actions.dart';

/// [ActionTask] is a task contains the [ActionContext] in which the action
/// is executed, the [BaseAction] to execute and a [timeout]
class ActionTask {
  final ActionContext ctx;
  final BaseAction action;
  final DateTime createdAt = DateTime.now();
  final int? timeout;

  ActionTask(this.ctx, this.action, this.timeout);

  /// Executes the action and returns a [Future] that completes when the action
  /// is finished or the timeout is reached.
  /// If the timeout is reached, a [TimeoutException] is thrown.
  Future<bool> doAction() {
    // abort if timeout is reached
    if (timeout != null) {
      return action.doAction(ctx).timeout(Duration(milliseconds: timeout!));
    }

    return action.doAction(ctx);
  }
}
