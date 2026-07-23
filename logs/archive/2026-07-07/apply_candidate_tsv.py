from __future__ import annotations

import csv
import shutil
import argparse
from pathlib import Path
from datetime import datetime

parser = argparse.ArgumentParser()
parser.add_argument('--cand', default='docs/music-missing39-mdfind-strong-unique-2026-07-07.tsv')
parser.add_argument('--log', default='docs/music-missing39-mdfind-apply-2026-07-07.log')
args = parser.parse_args()

CAND = Path(args.cand)
LOG = Path(args.log)

applied = 0
skip_not_symlink = 0
skip_missing_source = 0
skip_not_file_source = 0
errors = 0

lines = []
lines.append(f'START {datetime.now().isoformat()}')
lines.append(f'CAND_FILE={CAND}')

with CAND.open('r', encoding='utf-8') as f:
    rd = csv.DictReader(f, delimiter='\t')
    for r in rd:
        link = Path(r['link_path'])
        src = Path(r['source_candidate'])

        if not link.is_symlink():
            skip_not_symlink += 1
            lines.append(f'NOT_SYMLINK\t{link}')
            continue
        if not src.exists():
            skip_missing_source += 1
            lines.append(f'MISS_SOURCE\t{link}\t{src}')
            continue
        if not src.is_file():
            skip_not_file_source += 1
            lines.append(f'SOURCE_NOT_REGULAR\t{link}\t{src}')
            continue

        try:
            tmp = link.with_name(link.name + '.restore_tmp')
            shutil.copy2(src, tmp)
            link.unlink()
            tmp.replace(link)
            applied += 1
            lines.append(f'APPLIED\t{link}\t{src}')
        except Exception as e:
            errors += 1
            lines.append(f'ERROR\t{link}\t{src}\t{e}')

lines.append(
    'SUMMARY '\
    f'applied={applied} '\
    f'skip_not_symlink={skip_not_symlink} '\
    f'skip_missing_source={skip_missing_source} '\
    f'skip_not_file_source={skip_not_file_source} '\
    f'errors={errors}'
)
lines.append(f'END {datetime.now().isoformat()}')

LOG.write_text('\n'.join(lines) + '\n', encoding='utf-8')
print('\n'.join(lines))
