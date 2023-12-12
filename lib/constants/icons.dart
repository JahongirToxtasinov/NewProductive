const _onboarding = 'assets/icons/onboarding';
const _global = 'assets/icons/global/';
const _tasks = 'assets/icons/tasks/';
const _drawer = 'assets/icons/drawer/';
const _notes = 'assets/icons/notes/';

abstract class OnboardingIcons {
  static const easyTimeManagement = '$_onboarding/easy_time_management.svg';
  static const trackYourExpenses = '$_onboarding/track_your_expenses.svg';
  static const next = '$_onboarding/next.svg';
  static const back = '$_onboarding/back.svg';
}

abstract class GlobalIcons {
  static const logo = '${_global}logo.svg';
  static const apple = '${_global}apple.svg';
  static const eyeOff = '${_global}eye_off.svg';
  static const eyeOn = '${_global}eye_on.svg';
  static const facebook = '${_global}facebook.svg';
  static const google = '${_global}google.svg';
  static const verify = '${_global}verify.svg';
  static const unVerify = '${_global}unVerify.svg';
  static const tasks = '${_global}tasks.svg';
  static const expense = '${_global}expense.svg';
  static const create = '${_global}create.svg';
  static const calendar = '${_global}calendar.svg';
  static const stats = '${_global}stats.svg';
}

abstract class TasksIcons {
  static const hamburger = '${_tasks}hamburger.svg';
  static const note = '${_tasks}note.svg';
  static const notification = '${_tasks}notification.svg';
  static const search = '${_tasks}search.svg';
  static const filter = '${_tasks}filter.svg';
  static const gym = '${_tasks}gym.svg';
  static const meetcam = '${_tasks}meetcamera.svg';
  static const link = '${_tasks}link.svg';
  static const study = '${_tasks}study.svg';
  static const taskmark = '${_tasks}task_mark.svg';
  static const workcase = '${_tasks}work_case.svg';

  static const checked = '${_tasks}checked.svg';
  static const unChecked = '${_tasks}unChecked.svg';
}
abstract class DrawerIcons {
  static const sun = '${_drawer}sun.svg';
  static const articles = '${_drawer}articles.svg';
  static const premium = '${_drawer}premiumStar.svg';
  static const settings = '${_drawer}settings.svg';
  static const terms = '${_drawer}terms.svg';
  static const faq = '${_drawer}faq.svg';
  static const help = '${_drawer}help.svg';
}
abstract class NotesIcons {
  static const voice = '${_notes}voice.svg';
}