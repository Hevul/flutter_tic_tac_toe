enum Side {
  x('X', 'assets/icons/cross.svg'),
  o('O', 'assets/icons/circle.svg'),
  none('', '');

  final String name;
  final String svgPath;

  const Side(this.name, this.svgPath);

  Side get toggle {
    switch (this) {
      case Side.x:
        return Side.o;
      case Side.o:
        return Side.x;
      case Side.none:
        return Side.none;
    }
  }
}
