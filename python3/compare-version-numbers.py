class Solution:
    """
    >>> Solution().compareVersion("1.2", "1.10")
    -1
    >>> Solution().compareVersion("1.01", "1.001")
    0
    >>> Solution().compareVersion("1.0", "1.0.0.0")
    0
    """

    def compareVersion(self, version1: str, version2: str) -> int:
        def parse_version(version):
            return [int(v) for v in version.split(".")]

        revisions1 = parse_version(version1)
        revisions2 = parse_version(version2)
        for i in range(0, max(len(revisions1), len(revisions2))):
            r1 = revisions1[i] if i < len(revisions1) else 0
            r2 = revisions2[i] if i < len(revisions2) else 0

            if r1 > r2:
                return 1
            elif r1 < r2:
                return -1
        return 0
