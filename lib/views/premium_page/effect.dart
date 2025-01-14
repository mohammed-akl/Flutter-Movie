import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:movie/actions/base_api.dart';
import 'action.dart';
import 'state.dart';

Effect<PremiumPageState> buildEffect() {
  return combineEffects(<Object, Effect<PremiumPageState>>{
    PremiumPageAction.action: _onAction,
    PremiumPageAction.changePlan: _changePlan,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
  });
}

void _onAction(Action action, Context<PremiumPageState> ctx) {}

Future _onInit(Action action, Context<PremiumPageState> ctx) async {
  ctx.state.scrollController = ScrollController();
  if (ctx.state?.user?.premium != null) {
    if (ctx.state.user.premium.subscriptionId == null) return;
    var _subscription = await BaseApi.getPremiumSubscription(
        ctx.state.user.premium.subscriptionId);
    if (_subscription != null)
      ctx.dispatch(PremiumPageActionCreator.setSubscription(_subscription));
  }
}

void _changePlan(Action action, Context<PremiumPageState> ctx) async {
  await Navigator.of(ctx.context).push(MaterialPageRoute(
      builder: (_) => Material(child: ctx.buildComponent('plan'))));
}

void _onDispose(Action action, Context<PremiumPageState> ctx) {
  ctx.state.scrollController.dispose();
}
