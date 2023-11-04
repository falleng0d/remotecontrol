import '../elements/element_base.dart';
import '../proto/interface.dart';
import '../src/virtualkeys.dart';

/// [BaseActionContext] is the context in which an action is executed.
/// It contains the controller that can be used to execute other actions.
/// If the action needs additional information, it can be added to this class.
/// by extending it.
class BaseActionContext {
  final BaseElement target;
  final String? description;

  const BaseActionContext(this.target, {this.description});
}

/// [BaseKeyActionContext] is the context in which a keyboard key action is executed.
class BaseKeyActionContext extends BaseActionContext {
  final KeyActionType actionType;
  final KeyOptions? options;

  final String? modifierId;
  bool get isModifier => modifierId?.isNotEmpty ?? false;

  const BaseKeyActionContext(BaseElement target, this.actionType,
      {String? description, this.options, this.modifierId})
      : super(target, description: description);
}

/// [BaseTapActionContext] is the context in which a keyboard tap action is executed.
typedef BaseTapActionContext = BaseKeyActionContext;

/// [BaseHotkeyActionContext] is the context in which a keyboard hotkey action is executed.
class BaseHotkeyActionContext extends BaseActionContext {
  final KeyActionType actionType;
  final HotkeyOptions? options;

  const BaseHotkeyActionContext(BaseElement target, this.actionType,
      {String? description, this.options})
      : super(target, description: description);
}

/// [BaseButtonActionContext] is the context in which a mouse button action is executed.
class BaseButtonActionContext extends BaseActionContext {
  final ButtonActionType actionType;

  const BaseButtonActionContext(BaseElement target, this.actionType,
      {String? description})
      : super(target, description: description);
}

/// [BaseMouseMoveActionContext] is the context in which a mouse move action is executed.
class BaseMouseMoveActionContext extends BaseActionContext {
  final double deltaX;
  final double deltaY;

  const BaseMouseMoveActionContext(BaseElement target, this.deltaX, this.deltaY,
      {String? description})
      : super(target, description: description);
}

/// [BaseToggleActionContext] is the context in which a switch action is executed.
class BaseToggleActionContext extends BaseActionContext {
  final bool state;

  const BaseToggleActionContext(BaseElement target,
      {String? description, required this.state})
      : super(target, description: description);
}
